

int [] [] myArray;

void setup()

{
  size (600,600,P3D); 
  int row = 20, col = 20;
  myArray = new int [row][col];
  for (int i = 0; i < row ; i = i +1) {
    myArray[i] = new int [col];
    for (int j = 0; j < col ; j = j +1) {
      myArray [i][j] = round(random(10));
    }
  }
 // cam = new Peasycam(this,150);
  
}

void draw()
{
  float rad;
  background(200);
  for (int i = 0 ; i < myArray.length; i++){
    for  (int j = 0; j <myArray[i].length; j++){

      float d = dist(i*20+10, j*20+10, mouseX, mouseY);
 noStroke();
      if(d<100)
      {
        fill(255-d,0,0,100 - d/100);
        rad = myArray[i][j] + 200/(d+1);
        
      }
      else
    {
      fill(255);
      rad = myArray[i][j] ;
    
    }
        
    
        
    {
      ellipse(i*20+10,j*20+10,rad,rad);
     
    }
  }
}
}


