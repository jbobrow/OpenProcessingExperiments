
public class Cell extends sObject {
  Network brain;
  float absX, absY;
  int energy = 0;
  int life = 0;
  boolean reproduce = true;
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
  
  public Plant bestPlant(ArrayList plants, Plant p) {
    Plant bestPlant = new Plant(round(getX()), round(getY()));
    if(plants.size() > 0) {
      bestPlant = (Plant)plants.get(0);
      int bDist = distance(bestPlant);
      for(int i=0; i<plants.size(); i++) {
        int nDist = distance((Plant)plants.get(i));
        if(nDist < bDist && plants.get(i) != p) {
          bestPlant = (Plant)plants.get(i);
          bDist = nDist;
        }
      }
    }
    return bestPlant;
  }
  public Cell bestCell(ArrayList cell, Cell c) {
    // There is always another cell (this)
    Cell bestCell = (Cell)cell.get(0);
    int bestCellDist = Integer.MAX_VALUE;
    for(int i=0; i<cell.size(); i++) {
      int nCellDist = distance((Cell)cell.get(i));
      if(nCellDist < bestCellDist && cell.get(i) != c && nCellDist != 0) {
         bestCell = (Cell)cell.get(i);
         bestCellDist = nCellDist;
      }
    }
    return bestCell;
  }
  
  public void moveCell() {
    float rise = tan(brain.Output[0].value*180); // Output 1
    float run = brain.Output[1].value; // Turn Up or Down
    float lngth = sqrt(rise*rise + run*run);
    rise /= lngth;
    run /= lngth;
    float speed = brain.Output[2].value; // Output 2
    
    absX += run*speed;
    absY += rise*speed;
    energy -= speed*PIXLE_MOVE_COST; // COST TO MOVE
    if(absX > width) energy = 0;//absX = width-getWidth();
    else if(absX < -10) energy = 0;//absX = 0;
    if(absY > height) energy = 0;//absY = height-getHeight();
    else if(absY < -10) energy = 0;//absY = 0;
    r.setLocation(round(absX), round(absY)); // MOVE THE CELL
  }
  
  public Cell reproduce(Cell other, int energy) {
    return new Cell(brain.crossMutate(other.brain)[round(random(1))], Gnm.crossMutate(other.Gnm), (int)(r.getX()+random(-20, 20)), (int)(r.getY()+random(-20, 20)), energy);
  }
  
  public boolean die(ArrayList cell, ArrayList plant) {
    if(energy <= 0) { // || life > Gnm.maxLife) { // LIFE dkjLKSDJALFKJD
      cell.remove(this);
      if(energy > 0)
        plant.add(new Plant((int)getX(), (int)getY(), energy, energy/SIZE_CAL+2));
      return true;
    }
    return false;
  }
  
  public void update(ArrayList cell, ArrayList plant) {
    life++;
    
    // GET CLOSEST PLANT
    Plant bestPlant = bestPlant(plant, null);
    //Plant nextBestPlant = bestPlant(plant, bestPlant);
    Cell bestCell = bestCell(cell, this);
    energy = constrain(energy, -10, MAXENERGY);
    r.setSize(energy/SIZE_CAL+2, energy/SIZE_CAL+2);

    brain.Input[0].value = (bestPlant.getX()-getX())/width;
    brain.Input[1].value = (bestPlant.getY()-getY())/height;
    brain.Input[2].value = (bestCell.getX()-getX())/width;
    brain.Input[3].value = (bestCell.getY()-getY())/height;
    /*
    brain.Input[2].value = getX()/width;
    brain.Input[3].value = getY()/height;
    */
    brain.Input[4].value = energy/MAXENERGY;
    brain.runNet();
    
    // This function evals and does moving
    moveCell();
    energy -= BASE_METABOLISM; // METABOLISM
        
    // Update Bool
    reproduce = (brain.Output[3].value >= 0) ? true : false;
        
    ////// EAT
    Rectangle or = bestPlant.getRect();
    if(r.intersects(or) || r.contains(or) || or.contains(r)) {
      energy += bestPlant.energy;
      plants.remove(bestPlant);
      //bestPlant.getRect().setLocation((int)random(width), (int)random(height));
      return;
    }
   
    ////// REPRODUCE
    Rectangle cr = bestCell.getRect();
    if(r.intersects(cr) && bestCell != this &&
      this.energy > ENERGYTOREPRODUCE && bestCell.energy > ENERGYTOREPRODUCE && 
          bestCell.life > bestCell.Gnm.reporductionAge && this.life > this.Gnm.reporductionAge &&
            this.reproduce && bestCell.reproduce) {
      int energyToGive = round(energy*ENERGY_TOGIVE + bestCell.energy*ENERGY_TOGIVE);
      cell.add(reproduce(bestCell, energyToGive));
      energy = round(energy * ENERGY_TOGIVE - ENERGYTOREPRODUCE);
      bestCell.energy = round(bestCell.energy * ENERGY_TOGIVE - ENERGYTOREPRODUCE);
    }
    
    
    die(cell, plant);
  }
}

