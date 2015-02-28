


int tracking=10;
int leading=10;
int numberOfPositions=tracking*leading; //this is how many rects there are in the grid
float widths=width/tracking; //width of each box
float heights=height/leading; //height of each box
float[] xPositions;
float[] yPositions;
float[] greenRects; //this is to draw the rect in diff places




void setup(){
  size(640,480);
  background(255);
  noStroke();
  rectMode(CENTER);
  xPositions=new float[tracking];
  yPositions=new float[leading];
  greenRects=new float [numberOfPositions];

}

void draw() {
  
 
  fill(255,50);
  rect(width/2, height/2 ,width,height);
  noFill();
  for(int rows=1; rows<leading; rows=rows+1){
   for(int columns=1; columns<tracking; columns=columns+1){
      stroke(223,223,223);
     //stroke(map(i+j, 1, tracking+leading,0,255), 200, 250);
     rect(map(columns,0,tracking, 0, width),
             map(rows,0,leading,0,height),
             width/tracking, height/leading);
   }
  }



 
 mousePosition(); //senses which box the mouse is in
}

//right 1/2 rect up 1.5 rect
//width/tracking=block width
//height/leading=block height
//trc=number of block from left to right
//lea=number of block from top to bottom
void mousePosition(){

  int blockWidth=width/tracking;
  int blockHeight=height/leading;
  
  for(int trc=1; trc<tracking; trc++){
    for(int lea=1; lea<leading; lea++){
      if(mouseX>blockWidth*trc-(blockWidth/2)
         &&mouseX<blockWidth*trc+(blockWidth/2)
         &&mouseY>blockHeight*lea-(blockHeight/2)
         &&mouseY<blockHeight*lea+(height/leading)-(blockHeight/2)
         ){
          noStroke();
          fill(162,255,0);
          rect(blockWidth*trc, blockHeight*lea,width/tracking, height/leading);
          
          println(mouseX + "  "  + mouseY);

      }
    }
  }
  
  
}


