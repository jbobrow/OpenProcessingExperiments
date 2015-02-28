
void setup (){
  size (600,600);
  smooth();
  background(0);
  
}

void draw (){
  //for(int i =0; i < 1000; i +=60){
    //textSize(10);
    //text("guy in front of you can't go 3 and a half hours without pulling up porn", 0, i*10);
  //noFill();
  //stroke(255);
  //ellipse(width/2,height/2,i,i);// width/2 height/2 center 1/2 with 1/2 height
  //for(int i = 0; i < width; i++){
    //float colorValue;
    //colorValue = map(i,0,width,0,255);
    //stroke(colorValue);
    //line(i,0,i,height);
    for(int x = 0; x <width; x+=10){
    for(int y = 0; y <height; y+=10){
      ellipse(x,y,20,20);
  
    }
    }
    for(int x = 0; x <width; x+=10){  
    for(int y = 0; y <height; y+=10){
      strokeWeight(.8);
      stroke(random(255),random(255),random(255));
      line (width/2,height/2,x,y);
    }
    }
    for(int x = 0; x <width; x+=10){
    for(int y = 0; y <height; y+=10){
      strokeWeight(2);
      stroke(random(255),random(255),random(0));
      quad(250,300,300,250,350,300,300,350);
      fill(random(255),random(0),random(0));
   
      quad (275,300,300,275,325,300,300,325);
    
    //strokeWeight(5);
    //stroke(255);
    //line(300,500,300,500);
  }
    }
  }


