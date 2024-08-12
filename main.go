package main

import (
	"fmt"
	"math/rand"
	"slices"
)

type knight struct {
	id string
	hp int
}

type knights []knight

func (k knight) hit(damage int, next knight) knight {
	fmt.Printf("%s (HP=%d) hit %s (HP=%d) with damage %d\n", k.id, k.hp, next.id, next.hp, damage)
	next.hp = max(next.hp-damage, 0)
	return next
}

func (k knight) isAlive() bool {
	return k.hp > 0
}

func newKnights(size int, health int) knights {
	ks := make(knights, size)
	for i := range size {
		ks[i] = knight{
			id: fmt.Sprintf("KNIGHT%d", i+1),
			hp: health,
		}
	}
	return ks
}

func (ks knights) cleanup() knights {
	return slices.DeleteFunc(ks, func(k knight) bool {
		if k.isAlive() {
			return false
		}
		fmt.Printf("%s died\n", k.id)
		return true
	})
}

func playRound(ks knights) knights {
	defer fmt.Println("---")
	for i, k := range ks {
		if len(ks) == 1 || !k.isAlive() {
			continue
		}
		var next int
		if i != len(ks)-1 {
			next = i + 1
		}
		damage := rand.Intn(6-1) + 1
		ks[next] = k.hit(damage, ks[next])
	}
	return ks.cleanup()
}

func main() {
	ks := newKnights(6, 10)
	for {
		if ks = playRound(ks); len(ks) == 1 {
			break
		}
	}
	fmt.Printf("%s (HP=%d) won the game\n", ks[0].id, ks[0].hp)
}
