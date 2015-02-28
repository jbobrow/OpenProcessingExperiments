
//Nicolette Hashey

int x=20;
int y=20;
float f=.1;



void setup(){
  size(500,500);
}



void draw(){ 
    background(0);
  for ( int x = 50; x < 450; x += 30){//horizontal
  for (int y = 50; y < 450; y += 30){//vertical
    fill(255);
    noStroke();
    arc(x,y,25,25,f*PI,(1+f)*PI);//draw arc
    f=f+.01;//increase rotation each loop
  }
  }
    
}


