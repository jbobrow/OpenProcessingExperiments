
String w ="Cold";
String s ="Hot";

void setup(){
  size(500,500);
}
void draw(){
  background(20);
    noStroke();
    //Winter
    fill(#E3E3E3);
    rect(mouseX-504,0,600,800);
    //Sommer
    fill(255);
    rect(mouseX,0,500,800);
  stroke(1);
  fill(255);
  //Winter
  if(mouseX >=0 && mouseX <= 450){
    //Schneemann
    ellipse(mouseX-200,300,100,100);
    ellipse(mouseX-200,260,80,80);
    ellipse(mouseX-200,220,60,60);
    
    //Gesicht
    fill(0);
    ellipse(mouseX-210,210,5,5);
    ellipse(mouseX-190,210,5,5);
    triangle(mouseX-200,225,mouseX-200,215,mouseX-210,220);
    arc(mouseX-200, 230, 20, 20, 0, PI);
    
    //Knöpfe
    ellipse(mouseX-200,260,4,4);
    ellipse(mouseX-200,280,4,4);
    
    ellipse(mouseX-200,310,4,4);
    ellipse(mouseX-200,330,4,4);
    
    //Hut
    fill(255);
    rect(mouseX-225,190+5,50,5);
    fill(100);
    rect(mouseX-220,180+5,40,10);
    fill(255);
    rect(mouseX-220,150+5,40,30);
    
    //Rechen
    strokeWeight(2);
    line(mouseX-125,225,mouseX-125,350);
    strokeWeight(1);
    line(mouseX-105,200,mouseX-125,225);
    line(mouseX-115,200,mouseX-125,225);
    line(mouseX-125,200,mouseX-125,225);
    line(mouseX-145,200,mouseX-125,225);
    line(mouseX-135,200,mouseX-125,225);
    
    //Boden
    rect(mouseX-500,350,500,200);
  }
  else if(mouseX >= 450){
    //Schneemann
    ellipse(250,300,100,100);
    ellipse(250,260,80,80);
    ellipse(250,220,60,60); 
    
    //Gesicht
    fill(0);
    ellipse(260,210,5,5);
    ellipse(240,210,5,5);
    triangle(250,225,250,215,240,220);
    arc(250, 230, 20, 20, 0, PI);
    
    //Knöpfe
    ellipse(250,260,4,4);
    ellipse(250,280,4,4);
    
    ellipse(250,310,4,4);
    ellipse(250,330,4,4);
    
    //Hut
    fill(255);
    rect(225,190+5,50,5);
    fill(100);
    rect(230,180+5,40,10);
    fill(255);
    rect(230,150+5,40,30);
    
    // Rechen
    strokeWeight(2);
    line(325,225,325,350);
    strokeWeight(1);
    line(345,200,325,225);
    line(325,200,325,225);
    line(335,200,325,225);
    line(315,200,325,225);
    line(305,200,325,225);
    
    //Boden
    rect(0,350,mouseX,200);
    
  }
  textSize(32);
  text(w,mouseX-290,30);
  
  //Sommer
  fill(#FFFFFF);
  //Wasser
  if(mouseX <= 500 && mouseX >= 60){
    ellipse(mouseX+200,100,100,100);
//if(frameCount%10==0){
    float a = random(50);
    float inc = TWO_PI/15.0;
    for(int e = 350; e<=500;e+=5){
      for (int i = 1; i < 500; i=i+5) {
        line(mouseX+i, e,mouseX+i, e+sin(a)*30.0);
        a = a + inc/10;
      }
    }
//  }
}
  //Wasser
  else if(mouseX <= 250){
    ellipse(250,100,100,100);
    float a = random(50);
    float inc = TWO_PI/15.0;
    for(int e = 350; e<=500;e+=5){
      for (int i = 1; i < 500; i=i+5) {
        line(mouseX+i, e,mouseX+i, e+sin(a)*30.0);
        a = a + inc/10;
      }
    }
  }
  textSize(32);
  fill(0);
  text(s,mouseX+220,30);
  //Schnee
/*    
  stroke(0);
  for( int e = 0 ; e <= 500; e +=50){
        for(int i = 0; i<= 400; i+= 50){
          ellipse(mouseX- 1000 + e +i,50+i,2,2);
        }
     }
*/
}
