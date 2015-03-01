
int ox1 = 200;    //obsticle location
int oy1 = 200;
int ox2 = 500;    //obsticle location
int oy2 = 500;
int ox3 = 200;    //obsticle location
int oy3 = 500;
int ox4 = 500;    //obsticle location
int oy4 = 200;
int ox5 = 350;    //obsticle location
int oy5 = 350;
int sz = 10;    //enemy size
int hb = 20;    //hitbox
int aix = 0;      //spawn point 1
int aiy = 0;
int aix2 = 700;   //spawn point 2
int aiy2 = 0;
int aix3 = 700;   //spawn point 3
int aiy3 = 700;
int aix4 = 0;     //spawn point 4
int aiy4 = 700;
int aix5 = 350;   //spawn point 5
int aiy5 = -50;
int aix6 = 750;   //spawn point 6
int aiy6 = 350;
int aix7 = 350;   //spawn point 7
int aiy7 = 750;
int aix8 = -50;   //spawn point 8
int aiy8 = 350;
int aispeed = int(3);
int count = 0;
int death = 0;
float c1 = 0;      //sub-counters
float c2 = 0;
float c3 = 0;
float c4 = 0;
float c5 = 0;
float c6 = 0;
float c7 = 0;
float c8 = 0;
int col = 10;

void setup(){
  size(650,650);
  background(255);
  noStroke();
}                      //end setup

void draw(){
        if(death <= -1){
          col = col + 1;
          background(255-col);
          text("YOU ARE THE WORST PERSON.", 250, 350);
          text("But your score is: ", 250, 400);
          text(count, 400, 400); 
          text("Press space to restart...", 560, 690);
          if(keyPressed){
            death = 0;
            count = 0;                  // add all the int so everything is restarted
            aix = 0;      //spawn point 1
            aiy = 0;
            aix2 = 700;   //spawn point 2
            aiy2 = 0;
            aix3 = 700;   //spawn point 3
            aiy3 = 700;
            aix4 = 0;     //spawn point 4
            aiy4 = 700;
            aix5 = 350;   //spawn point 5
            aiy5 = -50;
            aix6 = 750;   //spawn point 6
            aiy6 = 350;
            aix7 = 350;   //spawn point 7
            aiy7 = 750;
            aix8 = -50;   //spawn point 8
            aiy8 = 350;
            c1 = 0;
            c2 = 0;
            c3 = 0;
            c4 = 0;
            c5 = 0;
            c6 = 0;
            c7 = 0;
            c8 = 0;
          }  }  //end death if
        else{
  count = count + 1;
  background(0);
//  fill(100,25,62);
//  text(count, 350,350);
//  text(death, 350,250);
  fill(255,0,0);
  ellipse(mouseX,mouseY,hb,hb);
    
//=======================================obsticle
  if(count >= 300){
  fill(random(255));                                                                //=============== ob 1
  rect(ox1,oy1,hb,hb);
    if(mouseX > ox1 && mouseX < (ox1+hb) && mouseY > oy1 && mouseY < (oy1+hb)){  
          death = death -1;         
} //hitbox if
  }
  if(count >= 600){                                                                //=============== ob 2
    rect(ox2,oy2,hb,hb); 
    if(mouseX > ox2 && mouseX < (ox2+hb) && mouseY > oy2 && mouseY < (oy2+hb)){  
          death = death -1;         
} //hitbox if
  }
  if(count >= 900){                                                                //=============== ob 3
    rect(ox3,oy3,hb,hb); 
    if(mouseX > ox3 && mouseX < (ox3+hb) && mouseY > oy3 && mouseY < (oy3+hb)){  
          death = death -1;         
} //hitbox if
  }
    if(count >= 1200){                                                                //=============== ob 4
    rect(ox4,oy4,hb,hb); 
    if(mouseX > ox4 && mouseX < (ox4+hb) && mouseY > oy4 && mouseY < (oy4+hb)){  
          death = death -1;         
} //hitbox if
  }
    if(count >= 1500){                                                                //=============== ob 5
    rect(ox5,oy5,hb,hb); 
    if(mouseX > ox5 && mouseX < (ox5+hb) && mouseY > oy5 && mouseY < (oy5+hb)){  
          death = death -1;         
} //hitbox if
  }
//=======================================obsticle end
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//======================================AI shit 
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
if(count >= 100){                    //================================count 100    #1
  c1 = c1 + 1;
  if(c1 >= 350){          //reset after 350
    c1 = 0 + random(350);
    aix = 0;
    aiy = 0;
  }//end respawn
if (aix >= mouseX) //ai
    {aix -= aispeed;}
if (aix < mouseX)
    {aix += aispeed;}
if (aiy >= mouseY)
    {aiy -= aispeed;}
if (aiy < mouseY)
    {aiy += aispeed;}
 
if(mouseX > aix-25 && mouseX < aix+25 && mouseY > aiy-25 && mouseY < aiy + 25){
    
    death = death -1;
}//end if hit
fill(random(255), 0, 0);
ellipse(aix, aiy, sz, sz);
}//end if count
//================================================================================
//================================================================================
if(count >= 200){                    //================================count 200  #2
  c2 = c2 + 1;
  if(c2 >= 350){          //reset after 350
    c2 = 0 + random(350);
    aix2 = 700;
    aiy2 = 0;
  }
if (aix2 >= mouseX) //ai
    {aix2 -= aispeed;}
if (aix2 < mouseX)
    {aix2 += aispeed;}
if (aiy2 >= mouseY)
    {aiy2 -= aispeed;}
if (aiy2 < mouseY)
    {aiy2 += aispeed;}
 
if(mouseX > aix2-25 && mouseX < aix2+25 && mouseY > aiy2-25 && mouseY < aiy2 + 25){
    
    death = death -1;
}
fill(0, random(255), 0);
ellipse(aix2, aiy2, sz, sz);
}//end if count
//if(count >= 300){                  //=================get big???
//  ellipse(aix2, aiy2, 80, 80);  
//}
//================================================================================                                  
if(count >= 300){                    //================================count 300    #3
  c3 = c3 + 1;
  if(c3 >= 350){          //reset after 350
    c3 = 0 + random(350);
    aix3 = 700;
    aiy3 = 700;
  }//end respawn
if (aix3 >= mouseX) //ai
    {aix3 -= aispeed;}
if (aix3 < mouseX)
    {aix3 += aispeed;}
if (aiy3 >= mouseY)
    {aiy3 -= aispeed;}
if (aiy3 < mouseY)
    {aiy3 += aispeed;}
 
if(mouseX > aix3-25 && mouseX < aix3+25 && mouseY > aiy3-25 && mouseY < aiy3 + 25){
    
    death = death -1;
}//end if hit
fill(0, 0, random(255));
ellipse(aix3, aiy3, sz, sz);
}//end if count
//================================================================================
if(count >= 400){                    //================================count 400    #4
  c4 = c4 + 1;
  if(c4 >= 350){          //reset after 350
    c4 = 0 + random(350);
    aix4 = 0;
    aiy4 = 700;
  }//end respawn
if (aix4 >= mouseX) //ai
    {aix4 -= aispeed;}
if (aix4 < mouseX)
    {aix4 += aispeed;}
if (aiy4 >= mouseY)
    {aiy4 -= aispeed;}
if (aiy4 < mouseY)
    {aiy4 += aispeed;}
 
if(mouseX > aix4-25 && mouseX < aix4+25 && mouseY > aiy4-25 && mouseY < aiy4 + 25){
    
    death = death -1;
}//end if hit
fill(random(255), random(255), 0);
ellipse(aix4, aiy4, sz, sz);
}//end if count
//================================================================================
if(count >= 500){                    //================================count 500    #5
  c5 = c5 + 1;
  if(c5 >= 350){          //reset after 350
    c5 = 0 + random(350);
    aix5 = 350;
    aiy5 = -50;
  }//end respawn
if (aix5 >= mouseX) //ai
    {aix5 -= aispeed;}
if (aix5 < mouseX)
    {aix5 += aispeed;}
if (aiy5 >= mouseY)
    {aiy5 -= aispeed;}
if (aiy5 < mouseY)
    {aiy5 += aispeed;}
 
if(mouseX > aix5-25 && mouseX < aix5+25 && mouseY > aiy5-25 && mouseY < aiy5 + 25){
    
    death = death -1;
}//end if hit
fill(random(255), 0, random(255));
ellipse(aix5, aiy5, sz, sz);
}//end if count
//================================================================================
if(count >= 600){                    //================================count 600    #6
  c6 = c6 + 1;
  if(c6 >= 350){          //reset after 350
    c6 = 0 + random(350);
    aix6 = 750;
    aiy6 = 350;
  }//end respawn
if (aix6 >= mouseX) //ai
    {aix6 -= aispeed;}
if (aix6 < mouseX)
    {aix6 += aispeed;}
if (aiy6 >= mouseY)
    {aiy6 -= aispeed;}
if (aiy6 < mouseY)
    {aiy6 += aispeed;}
 
if(mouseX > aix6-25 && mouseX < aix6+25 && mouseY > aiy6-25 && mouseY < aiy6 + 25){
    
    death = death -1;
}//end if hit
fill(0, random(255), random(255));
ellipse(aix6, aiy6, sz, sz);
}//end if count
//================================================================================
if(count >= 700){                    //================================count 700    #7
  c7 = c7 + 1;
  if(c7 >= 350){          //reset after 350
    c7 = 0 + random(350);
    aix7 = 350;
    aiy7 = 750;
  }//end respawn
if (aix7 >= mouseX) //ai
    {aix7 -= aispeed;}
if (aix7 < mouseX)
    {aix7 += aispeed;}
if (aiy7 >= mouseY)
    {aiy7 -= aispeed;}
if (aiy7 < mouseY)
    {aiy7 += aispeed;}
 
if(mouseX > aix7-25 && mouseX < aix7+25 && mouseY > aiy7-25 && mouseY < aiy7 + 25){
    
    death = death -1;
}//end if hit
fill(random(255), random(255), random(255));
ellipse(aix7, aiy7, sz, sz);
}//end if count
//================================================================================
if(count >= 800){                    //================================count 800    #8
  c8 = c8 + 1;
  if(c8 >= 350){          //reset after 350
    c8 = 0 + random(350);
    aix8 = -50;
    aiy8 = 350;
  }//end respawn
if (aix8 >= mouseX) //ai
    {aix8 -= aispeed;}
if (aix8 < mouseX)
    {aix8 += aispeed;}
if (aiy8 >= mouseY)
    {aiy8 -= aispeed;}
if (aiy8 < mouseY)
    {aiy8 += aispeed;}
 
if(mouseX > aix8-25 && mouseX < aix8+25 && mouseY > aiy8-25 && mouseY < aiy8 + 25){
    
    death = death -1;
}//end if hit
fill(random(255), random(255), random(255));
ellipse(aix8, aiy8, sz, sz);
}//end if count
//================================================================================
        } //death else end
}//draw end


