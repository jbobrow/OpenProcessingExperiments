
import java.awt.Rectangle;
import java.util.ArrayList;

public class Cell extends sObject {
	Network brain;
	float absX, absY;
	int energy = 0;
	int life = 0;
	boolean reproduce = true;
	boolean eat = false;
	boolean dormant = false; // NOT IN USE
	Genome Gnm;

	public Cell(Network n, Genome g, int x, int y, int en) {
		brain = n;
		Gnm = g;
		energy = en;
		r = new Rectangle(x, y, 10, 10);
		absX = x;
		absY = y;
	}

	public Plant bestPlant(ArrayList<Plant> plants, Plant p) {
		Plant bestPlant = plants.get(0);
		// bestPlant = (bestPlant != p) ? bestPlant : plants.get(1);
		int bDist = distance(bestPlant);
		for (int i = 1; i < plants.size(); i++) {
			Plant nPlant = plants.get(i);
			int nDist = distance(nPlant);
			if (nDist < bDist && nPlant != p) {
				bestPlant = nPlant;
				bDist = nDist;
			}
		}
		return bestPlant;
	}

	public Cell bestCell(ArrayList<Cell> cell, Cell c) {
		// There is always another cell (this)
		Cell bestCell = (Cell) cell.get(0);
		int bestCellDist = distance(bestCell);
		for (int i = 1; i < cell.size(); i++) {
			Cell nCell = cell.get(i);
			int nCellDist = distance(nCell);
			if ((nCellDist < bestCellDist && nCell != c && nCellDist != 0)
					|| bestCellDist == 0) {
				bestCell = nCell;
				bestCellDist = nCellDist;
			}
		}
		return bestCell;
	}

	public void moveCell() {
		float run = brain.Output[1].value;
		float rise = brain.Output[0].value;
		float speed = Math.abs(run + rise); // Output 2
		absX += run;
		absY += rise;
		energy -= speed * PIXLE_MOVE_COST; // COST TO MOVE
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
                     (int) (r.getX() + random(-15, 15)), (int) (r.getY() + random(-15, 15)), energy);
	}

	public boolean die(ArrayList<Cell> cell, ArrayList<Plant> plant) {
		if (energy <= 0 && (life > Gnm.maxAge || !AGE_LIMIT)) { // LIFE
			cell.remove(this);
			if (energy > 0)
				plant.add(new Plant((int) getX(), (int) getY(), energy, energy / SIZE_CAL + 2));
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
		brain.Input[2].value = (bestCell.getX() - getX()) / width;
		brain.Input[3].value = (bestCell.getY() - getY()) / height;
		brain.Input[4].value = (bestCell.energy) / MAXENERGY;
		/*
		 * brain.Input[2].value = getX()/width; brain.Input[3].value =
		 * getY()/height;
		 */
		brain.Input[5].value = energy / MAXENERGY;
		brain.Input[6].value = life / MAX_AGE_FROMBINARY;
		//brain.Input[8].value = (bestCell.Gnm.gHue/256);
		brain.runNet();

		// This function evals and does moving
		moveCell();
		energy -= BASE_METABOLISM; // METABOLISM

		// Update Bool
		reproduce = (brain.Output[2].value >= 0);
		eat = (brain.Output[3].value >= 0);
		if (eat)
			energy -= EAT_ENERGY; // If trying to eat using energy

		// //// EAT
		Rectangle or = bestPlant.getRect();
		if (r.intersects(or) || r.contains(or) || or.contains(r)) {
			energy += bestPlant.energy;
			plants.remove(bestPlant);
			// bestPlant.getRect().setLocation((int)random(width),
			// (int)random(height));
			return;
		}

		// Rep, [-1.0, 0.0] do nothing, [0.0, 0.5] find mate and rep, [0.5, 1.0]
		// asexual

		// //// REPRODUCE
		boolean reproduced = false;
		if (bestCell != this) { // Valid Choice
			Rectangle cr = bestCell.getRect();
			boolean intersects = r.intersects(cr) || r.contains(cr) || cr.contains(r);
			if (this.life > this.Gnm.reporductionAge // If can reproduce
					&& this.energy > ENERGYTOREPRODUCE && this.reproduce) {
				if (intersects) { // sextual reproduction
					if (bestCell.energy > ENERGYTOREPRODUCE
							&& bestCell.life > bestCell.Gnm.reporductionAge) {
						int energyToGive = (int) (energy * ENERGY_TOGIVE + bestCell.energy
								* ENERGY_TOGIVE);
						cells.add(reproduce(bestCell, energyToGive));
						energy = (int) (energy * ENERGY_TOGIVE - ENERGYTOREPRODUCE);
						bestCell.energy = (int) (bestCell.energy
								* ENERGY_TOGIVE - ENERGYTOREPRODUCE);
						reproduced = true;
					}
				} else if (brain.Output[2].value > 0.5) { // asextual
					int energyToGive = (int) (energy * ENERGY_TOGIVE);
					cells.add(reproduce(this, energyToGive));
					energy = energyToGive - ENERGYTOREPRODUCE;
				}
			} 
			if (this.eat && !reproduced
					&& intersects && (this.energy > bestCell.energy || !bestCell.eat)) { // If eating and larger than other
				float rnd = random(0.90f);
				energy += bestCell.energy * rnd;
				bestCell.energy -= bestCell.energy * (rnd+0.25);
				if(bestCell.energy < 0) cells.remove(bestCell);
			}
		}

		die(cells, plants);
	}
}

