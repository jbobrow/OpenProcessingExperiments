

//Leung Sze Mei_Mei_52631410//Assignment 2
void setup(){
size(600,400);

noStroke();
smooth();
background(255);
fill(0);

}
void draw(){
stroke (255,200,200);
line(0,0,30,20);
line(600,0,570,20);


//If/else//
noStroke();
  background(255); // 
if (mouseX<width/7) { //7 part 
    fill(#fd9dad); //red 
    ellipse(160,200,40,40); 
  }
  else if (mouseX<width*2/7) { 
    fill(#ffa462); //orange
    ellipse(200,250,40,40); 
  }
  
   else if (mouseX<width*3/7) { 
    fill(#f9fa87); // yellow
    ellipse(240,200,40,40); 
  }
   else if (mouseX<width*4/7) { 
    fill(#70b97e); // green
    ellipse(280,250,40,40);  
  }
   else if (mouseX<width*5/7) {  
    fill(#78ec8e); // 
    ellipse(320,200,40,40);  
  }
   else if (mouseX<width*6/7) { 
    fill(#a0eaff); // blue
    ellipse(360,250,40,40); 
  }
  
  else { 
    fill(#e1adff); //purple
    ellipse(400,200,40,40); 
  }

//for structuces//
for (int y=600 ;y>0; y-=20){
  stroke(240);
  line(0,y,30,y);
}
for (int y=600 ;y>0; y-=20){
  stroke(255,200,200);
   strokeWeight(2);
  line(0,y,30,y+20 ); 
}

for(int y=600 ;y>0; y-=20){
  stroke (240);
  line(570,y,600,y);
}

for(int y=600 ;y>0; y-=20){
  stroke (255,200,200);
  line(600,y,570,y+20);
}


fill(180);
    textSize(20);
    text("What are the colours of the rainbow? ", 140, 100);//
    textSize(12);
   
}


