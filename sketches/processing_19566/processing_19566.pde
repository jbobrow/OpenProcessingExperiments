
void setup(){

size(1000,1000);
background(0);
smooth();
fill(255);
colorMode(RGB,1000);
frameRate(100);

}


void draw (){
  for(int y = 20; y < height-120; y += 120){  //sets up vertical grid spacing
    for(int x = 20; x <= width*.75; x += 50){   //sets up horizontal grid spacing
    
    atom ( x,y );
    stroke(x);       //adjusts stroke from black to white as x grows
    line(x + 20,y + 50,800,220);  //draws lines
 
    }
  }
}

void atom (int x, int y){    //custom function for atom
pushMatrix();
translate( x,y);

stroke(220);
line(20,50,23,65);
line(20,50,10,35);
line(20,50,35,50);

noStroke();
fill(random(100,1000),0,0);
ellipse(20,50,10,10);
stroke(random(0,500));
fill(0,0,random(100,1000));
ellipse(23,65,2,2);
ellipse(10,35,5,5);
ellipse(35,50,3,3);


fill(random(0,750));
ellipse(20,50,6,6);

popMatrix();  

}



