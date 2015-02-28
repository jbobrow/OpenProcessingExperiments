
//The x and y points of the triangles
int x1 = -56;
int y1 = 0;
int x2 = -28;
int y2 = -25;
int x3 = 0;
int y3 = 0;

//Used for working out the translation amount
int triwidth = x3 - x1;
int triheight = y3 - y2;

void setup(){
  size(500,500);
  background(0);
  noLoop();
}


void draw()
{
  //triangle(x1, y1, x2, y2, x3, y3);
  
  //Top side is flat triangles
  for(int i=0; i < width+triwidth; i= i+triwidth){
    for(int j=0; j < height+triwidth; j= j +triheight ){
      
      //get a random number for the alpha value within 0 - 100 only having 5 different values
      float rndm = random(0, 6);
      rndm = (int)rndm;
      rndm = rndm*20;
      
      fill(255, rndm);
      noStroke();

      triangle(x2 + triwidth + i, y2 + j, x2 + i, y2 + j, x3 + i, y3 + j);
      smooth();      
    }
  }
  
  //top side is pointy triangles
  for(int i=0; i < width+triwidth; i= i+triwidth){
    for(int j=0; j < height+triwidth; j= j +triheight ){
      
      //get a random number for the alpha value within 0 - 100 only having 5 different values
      float rndm = random(0, 6);
      rndm = (int)rndm;
      rndm = rndm*20;
      
      fill(255, rndm);
      noStroke();

      triangle(x1 + i, y1 + j, x2 + i, y2 + j, x3 + i, y3 + j); 
      smooth();      
    }
  }
}



void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

