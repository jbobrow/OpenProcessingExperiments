
class Cell {
    float x,y; //cell coordinates
    boolean alive = false;
    boolean aliveNextStep = false;
    int age = 0;
    
    //constructor
    Cell(float _x, float _y) {
        x = _x;
        y = _y;
    }
    
    void setAliveRandom(int randomChance)
    {
        float randomNum = random(0,10);
        if(randomNum<constrain(randomChance,1,9))
            setAlive(true);
        else
            setAlive(false);
    }
    
    void setAlive(boolean isAlive)
    {
        alive = isAlive;
        aliveNextStep = isAlive;
    }
    
    //display this cell
    void display() {
        alive = aliveNextStep;
        
        //change age based on if it's alive
        if(alive && settlingOn)
            age++;
        else
            age = 0;
            
        stroke(0);
        
        //if this cell is old, make it red, if its not display its living status
        if(age > ageThreshold && settlingOn )
            fill(255,100,100);
        else if(alive)
            fill(255);
        else
            fill(0);
        
        //draw the rectangle for the cell
        rect(x*cellSize,y*cellSize,cellSize,cellSize); 
    }
}

