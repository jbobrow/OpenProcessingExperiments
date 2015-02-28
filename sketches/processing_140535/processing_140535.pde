

void setup() {
  size(900, 900);
  background(255);
}

//creating function for what it looks like for a little bug in a bed of grass//


void draw() { 
 //each set of lines is different blades of grass//  
 stroke((mouseX+200)*.255,(mouseX+290)*.255,(mouseX+100)*.255,20); 
  for(int pos = 0;pos<width/2;pos+=8){
    line(height/2,0,pos,height);

    stroke((mouseX+300)*.210,(mouseX+390)*.210,(mouseX+100)*.255,10); 
  for(int pos1 = 12;pos<width/4;pos+=10){
    line(height/4,0,pos,height);
    
    stroke((mouseX+100)*.255,(mouseX+190)*.255,(mouseX+100)*.255,20); 
  for(int pos2 = 20;pos<width/1;pos+=30){
    line(height/6,0,pos,height);
    
    stroke((mouseX+900)*.210,(mouseX+990)*.210,(mouseX+100)*.255,10); 
  for(int pos3 =30;pos<width/3;pos+=45){
    line(height/8,0,pos,height);
    
      stroke((mouseX+900)*.255,(mouseX+990)*.255,(mouseX+100)*.255,20);
  for(int pos4 =30;pos<width/3;pos+=55){
    line(height/8,0,pos,height);
    
    
      stroke((mouseX+500)*.215,(mouseX+590)*.215,(mouseX+100)*.255,10); 
  for(int pos5 =30;pos<width/3;pos+=60){
    line(height/10,0,pos,height);
    
    
      stroke((mouseX+900)*.225,(mouseX+990)*.225,(mouseX+100)*.255,20); 
  for(int pos6 =30;pos<width/3;pos+=-65){
    line(height/12,0,pos,height);
    
      stroke((mouseX+700)*.210,(mouseX+790)*.210,(mouseX+100)*.255,10); 
  for(int pos7 =30;pos<width/3;pos+=5){
    line(height/14,0,pos,height);
    
      stroke((mouseX+800)*.210,(mouseX+890)*.210,(mouseX+70)*.255,20);
  for(int pos8 =30;pos<width/3;pos+=70){
    line(height/16,0,pos,height);
    
     stroke((mouseX+600)*.215,(mouseX+690)*.215,(mouseX+80)*.225,10); 
  for(int pos9 =130;pos<width/3;pos+=70){
    line(height/1,40,pos,height);
    
    stroke((mouseX+500)*.210,(mouseX+590)*.210,(mouseX+90)*.225,20); 
  for(int pos10 =140;pos<width/3;pos+=70){
    line(height/.5,90,pos,height);
    
   /* stroke((mouseX+400)*.250,(mouseX+490)*.210,(mouseX+90)*.225,10); 
  for(int pos11 =140;pos<width/3;pos+=70){
    line(height/.5,100,pos,height);
    
    stroke((mouseX+300)*.250,(mouseX+350)*.210,(mouseX+90)*.225,20); 
  for(int pos12 =140;pos<width/2;pos+=70){
    line(height/.5,70,pos,height);
    
    
    stroke((mouseX+150)*.210,(mouseX+200)*.210,(mouseX+90)*.225,10); 
  for(int pos13 =140;pos<width/3;pos+=70){
    line(height/.5,60,pos,height);
    
    stroke((mouseX+500)*.210,(mouseX+590)*.210,(mouseX+90)*.225,20); 
  for(int pos14 =140;pos<width/3;pos+=70){
    line(height/.5,80,pos,height);
    
    stroke((mouseX+900)*.210,(mouseX+990)*.210,(mouseX+90)*.225,10); 
  for(int pos15 =140;pos<width/3;pos+=70){
    line(height/.5,50,pos,height);*/
    
    
  } 

}


float hightofcirclerays = 5;
float wofcirclerays = 7;
int tint= 4;
 
 /*
  void constant() {
  wofcirclerays = wofcirclerays+=1;
  hightofcirclerays = hightofcirclerays+=1;
  
  if (wofcirclerays > 200 && hightofcirclerays > 200) {
      wofcirclerays= 3;
      hightofcirclerays = 5;
    }
}
  */
  
  fill((mouseX+890)*.250,(mouseX+445)*.210,(mouseX+100)*.255,tint);

  stroke((mouseX+700)*.255,(mouseX+800)*.255,(mouseX+450)*.255,tint);
  strokeWeight(mouseY);
  ellipse(mouseX, mouseY, wofcirclerays ,hightofcirclerays);
 //constant();
 
 
// void mouseReleased() {
  //wofcirclesunrays= 0;
  //hightofcirclesun= 0;
 //}
 
 
}}}}}}}}}}

//}}}}}







