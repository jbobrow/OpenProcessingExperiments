
void setup() {
size(300,300);
stroke(255);
}

//custom function:
void SHAPE(float x,float y,float z){
ellipse(x,y,z+30,z+30);
ellipse(x,y,z+20,z+20);
ellipse(x,y,z+10,z+10);
ellipse(x,y,z,z);
}

void draw() {
for(int countY=0;countY<height/10;countY++){
  for(int countX=0;countX<width/10;countX++){
     for(float r=random(0,80);r>=10; r-=5){
       fill(random(200,255),random(200,255),100);
     SHAPE(random(20)+(countX*10),random(20)+(countY*10),r);
    }
  }
}
}

    


