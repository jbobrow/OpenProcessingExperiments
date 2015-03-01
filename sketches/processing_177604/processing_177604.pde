
void setup(){
  size (500,500);
  background(0 );
}PFont font;
float slide=200,op=0,ko;
void draw(){
  background(0 );
  slide+=1;ko+=1;
  for(int index=0;index <60;index++){
 //rect(-20+(slide/2+(index%280)*5)%520,(index/40-index%14)*index%105,3,3);
 float d3 = 10 + (sin(20 + PI) * 40/2) + 40/2; ellipse(width, height/2, d3, d3);


  fill(250,250,index*5);
  


    rect(-20+(slide*2+(index)*40)%540,200+   (sin(constrain(slide, 0, 200)%index*40 )*sin(constrain(slide, 30, 70)%500*0.04*(slide*0.03+(index%300))) * 60),5+index%10,5+index%10);
 
stroke(250);


  } 
  

  
pushStyle();
font = loadFont("StarlinerBTN-48.vlw");
textFont(font, 15);
text("housegamejam",100,450);
popStyle();
}void mouseClicked(){op++;}
