

ArrayList<Cell> cellList;

void setup(){
   size(500,500);
   cellList = new ArrayList<Cell>();
}

void draw(){
  for(int i = 1; i < cellList.size() ; i++){
    Cell cell = cellList.get(i);
    if( cell != null ){
      cell.draw();
      if( cell.dead() ){
         cellList.remove(i);
      }
    }
  }
}

void mouseMoved(){
  cellList.add(new Cell(mouseX, mouseY));
}

class Cell{
  public int x;
  public int y;
  public int r = 200;
  public int g = 200;
  public int b = 200;
  private int life = 1000;
  
  Cell(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  boolean dead(){
    return this.life < 0;
  }
  
  private void act(){
    this.x +=  5 - random(10);
    this.y +=  5 - random(10);
    this.r += random(-10, 10);
    this.g += random(-10, 10);
    this.b += random(-10, 10);
    this.life -= 3;
  }
  
  void draw(){
    this.act();
    color c = color( this.r, this.g, this.b );
    fill( c );
    noStroke();
    rect( this.x, this.y, 10, 10);
    
  }
}



