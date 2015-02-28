
import java.awt.Rectangle;
import java.util.ArrayList;

public class Cell extends sObject {
	Network brain;
	float absX, absY;
        float speedX, speedY;
        float rotation;
	int energy = 0;
	int life = 0;
	boolean reproduce = true;
	boolean eat = false;
	boolean dormant = false; // NOT IN USE
	Genome Gnm;

        float MAXSPEED = 2;
        float MAX_TURN = 0.3f;


	public Cell(Network n, Genome g, int x, int y, int en) {
		brain = n;
                brain.mutationRate = g.mutationRate;
		Gnm = g;
		energy = en;
		r = new Rectangle(x, y, 10, 10);
		absX = x;
		absY = y;
	}

	public Plant bestPlant(ArrayList<Plant> plants, Plant p) {
		Plant bestPlant = new Plant((int)this.absX, (int)this.absY, false);
		// bestPlant = (bestPlant != p) ? bestPlant : plants.get(1);
		int bDist = MAX_INT;
		for (int i = 0; i < plants.size(); i++) {
			Plant nPlant = plants.get(i);
			int nDist = distance(nPlant);
			if (nDist < bDist) {
				bestPlant = nPlant;
				bDist = nDist;
			}
		}
		return bestPlant;
	}

	public Cell bestCell(ArrayList<Cell> cell, Cell c) {
		// There is always another cell (this)
		Cell bestCell = (Cell) cell.get(0);
		int bestCellDist = Integer.MAX_VALUE;
		for (int i = 0; i < cell.size(); i++) {
			Cell nCell = cell.get(i);
			int nCellDist = distance(nCell);
			if (nCellDist < bestCellDist && nCell != c && nCellDist != 0) {
				bestCell = nCell;
				bestCellDist = nCellDist;
			}
		}
		return bestCell;
	}
		//float run = brain.Output[0].value;
                //println("Real X: " + run);
		//float rise = brain.Output[1].value;
		//absX += run;
		//absY += rise;
                //float speed = Math.abs(run) + Math.abs(rise);
	public void moveCell() {
                float rotateSpeed = brain.Output[0].value - brain.Output[1].value;
                if(rotateSpeed > MAX_TURN)
                  rotateSpeed = MAX_TURN;
                else if(rotateSpeed < -MAX_TURN)
                  rotateSpeed = -MAX_TURN;
                rotation += rotateSpeed;
                  
		float speed = brain.Output[0].value + brain.Output[1].value;
		energy -= speed * PIXLE_MOVE_COST; // COST TO MOVE

                speedX = (float) -Math.sin(rotation);
                speedY = (float) Math.cos(rotation);
                absX += speedX * speed;
                absY += speedY * speed;
                
                if (absX > width) {
			absX = 0;
			energy -= R_EN;
		} else if (absX < 0) {
			absX = width;
			energy -= R_EN;
		}
		if (absY > height) {
			absY = 0;
			energy -= R_EN;
		} else if (absY < 0) {
			absY = height;
			energy -= R_EN;
		}
                
		r.setLocation((int) absX, (int) absY); // MOVE THE CELL
	}

	public Cell reproduce(Cell other, int energy) {
		return new Cell(brain.crossMutate(other.brain)[round(random(1))], Gnm.crossMutate(other.Gnm), 
                     (int) (r.getX() + (Gnm.repDirX-2)*5), (int) (r.getY() + (Gnm.repDirY-2)*5), energy);
	}

	public boolean die(ArrayList<Cell> cells, ArrayList<Plant> plant) {
		if (energy <= 0 || (life > MAXAGE && AGE_LIMIT)) { // LIFE
			cells.remove(this);
			if (energy > 0)
				plant.add(new Plant((int) getX(), (int) getY()));
			return true;
		}
		return false;
	}

        public boolean intersectReproduce(Cell other, ArrayList cell) {
          if (this.energy > ENERGYTOREPRODUCE && this.life > this.Gnm.reporductionAge) {
            //println("RREP");
            int energyToGive = (int) (other.energy * ENERGY_TOGIVE + this.energy * ENERGY_TOGIVE);
	    cells.add(other.reproduce(this, energyToGive));
            // ENERGY_TOGIVE = 1/2
	    other.energy = (int) (other.energy * ENERGY_TOGIVE - ENERGYTOREPRODUCE);
	    this.energy = (int) (this.energy * ENERGY_TOGIVE - ENERGYTOREPRODUCE);
            return true;
          }
          return false;
        }

	public void update(ArrayList<Cell> cells, ArrayList<Plant> plants) {
		life++;

		// GET CLOSEST PLANT
		Plant bestPlant = bestPlant(plants, null);
		  // Plant nextBestPlant = bestPlant(plant, bestPlant);
                Cell bestCell = bestCell(cells, this);
                
		energy = constrain(energy, -10, MAXENERGY);
		r.setSize(energy / SIZE_CAL + 2, energy / SIZE_CAL + 2);

		brain.Input[0].value = (bestPlant.getX() - getX()) / width;
		brain.Input[1].value = (bestPlant.getY() - getY()) / height;
                brain.Input[2].value = speedX / MAXSPEED;  
                brain.Input[3].value = speedY / MAXSPEED;
                brain.Input[4].value = energy / MAXENERGY;          
                
                /*if(brain.Input.length > 3) {
        	  brain.Input[2].value = (bestCell.getX() - getX()) / width;
        	  brain.Input[3].value = (bestCell.getY() - getY()) / height;
        	  brain.Input[4].value = (bestCell.energy) / MAXENERGY;
        	  
        	  brain.Input[6].value = (Gnm.maxAge - life) / MAX_AGE_FROMBINARY;
        	  brain.Input[7].value = random(-1, 1); // Free will
                }*/
		brain.runNet();

		// This function evals and does moving
		moveCell();
		energy -= BASE_METABOLISM; // METABOLISM

		// Update Bool
		// //// EAT
                Rectangle or = bestPlant.getRect();
		if (r.intersects(or) || or.contains(r) || r.contains(or)) {
                        energy += bestPlant.eaten(plants);
			return;
		}

		reproduce = brain.Output[2].value >= 0;
		eat = false;//brain.Output[3].value >= 0;

		if (eat)
			energy -= EAT_ENERGY; // If trying to eat using energy

		// Rep, [-1.0, 0.0] do nothing, [0.0, 0.5] find mate and rep, [0.5, 1.0] asexual
		// //// REPRODUCE
		boolean reproduced = false;
		if (bestCell != this) { // Valid Choice
			Rectangle cr = bestCell.getRect();
			boolean intersects = (r.intersects(cr) || r.contains(cr) || cr.contains(r));
			if (this.life > this.Gnm.reporductionAge // If can reproduce
                              && this.energy > ENERGYTOREPRODUCE && this.reproduce) {
				if (intersects) { // sextual reproduction
					if (bestCell.energy > ENERGYTOREPRODUCE && bestCell.life > bestCell.Gnm.reporductionAge) {
						int energyGiven = (int) (energy * Gnm.energyToGive + bestCell.energy * bestCell.Gnm.energyToGive);
						cells.add(reproduce(bestCell, energyGiven));
						energy -= (int) (energy * Gnm.energyToGive + ENERGYTOREPRODUCE);
						bestCell.energy -= (int) (bestCell.energy * bestCell.Gnm.energyToGive + ENERGYTOREPRODUCE);
						reproduced = true;
					}
				} else if (brain.Output[2].value >= 0.5) { // asextual
					int energyGiven = (int) (energy * Gnm.energyToGive);
					cells.add(reproduce(this, energyGiven));
					energy -= energyGiven + ENERGYTOREPRODUCE;
                                        //energy -= ENERGYTOREPRODUCE;
                                        reproduced = true;
				}
			} 
			if (this.eat && !reproduced && intersects && (this.energy > bestCell.energy || !bestCell.eat)) { // If eating and larger than other
				float rnd = random(0.90f);
				energy += bestCell.energy * rnd;
				bestCell.energy -= bestCell.energy * (rnd+0.2);
				if(bestCell.energy < 0) cells.remove(bestCell);
			}
		}
                if(reproduced) Realrep++;

		die(cells, plants);
	}
}

