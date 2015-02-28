
float obamaOH[]   = {51,44,49,46,49,38,50,47,48,45,46,49,44,45,50,48,44,45,47,47,48,47,50,48,45,44,50,49,45,50,50,48,47,51,48,49,53,52,51,49,51,50,51,47,45,51,46,48,51,45,51,45};
float romneyOH[]  = {47,42,42,42,46,44,38,41,40,39,42,44,42,44,43,42,46,48,38,44,45,45,44,45,45,46,44,46,45,45,43,47,46,46,44,42,43,44,42,45,43,49,47,48,44,45,42,47,46,42,46,42};
float daysOH[]    = {309.0,297.5,281.5,271.0,269.5,267.0,249.5,228.0,225.0,204.0,202.0,199.0,192.0,185.5,185.5,171.5,161.0,156.5,137.0,136.5,118.0,111.0,102.0,87.5,85.0,84.5,80.0,79.5,78.0,59.0,57.0,56.0,55.0,51.5,50.0,50.0,46.0,46.0,43.0,38.5,36.5,33.0,30.5,30.5,30.5,29.0,29.0,27.0,24.5,23.5,20,10};
float obamaFL[]   = {51,43,45,42,44,49,47,46,49,50,45,45,45,43,46,41,48,50,45,46,45,45,46,45,48,51,48,47,43,49,50,48,48,49,48,47,49,48,53,51,50,50,46,47,47,49,48,44,46,47,48,47};
float romneyFL[]  = {48,46,45,47,48,41,44,43,42,45,43,47,46,44,45,47,44,46,49,42,41,46,45,48,43,45,47,48,45,46,46,47,44,44,46,48,44,47,44,47,45,46,43,46,49,45,47,51,49,51,49,44};
float daysFL[]    = {309.0,304.0,289.0,287.0,285.0,284.0,270.0,238.0,228.0,206.5,204.0,199.0,195.0,192.0,183.0,172.0,171.5,157.5,156.5,144.0,137.0,120.0,119.0,118.0,111.0,102.0,101.5,84.5,83.0,80.0,74.0,66.0,59.0,57.0,55.0,50.0,50.0,49.0,46.0,46.0,46.0,45.5,38.5,36.5,33.0,32.0,29.0,28.0,27.5,26.0,24.0,22.0};
//float all[] = {51,44,49,46,49,38,50,47,48,45,46,49,44,45,50,48,44,45,47,47,48,47,50,48,45,44,50,49,45,50,50,48,47,51,48,49,53,52,51,49,51,50,51,47,45,51,46,48,51,45,47,42,42,42,46,44,38,41,40,39,42,44,42,44,43,42,46,48,38,44,45,45,44,45,45,46,44,46,45,45,43,47,46,46,44,42,43,44,42,45,43,49,47,48,44,45,42,47,46,42,309.0,297.5,281.5,271.0,269.5,267.0,249.5,228.0,225.0,204.0,202.0,199.0,192.0,185.5,185.5,171.5,161.0,156.5,137.0,136.5,118.0,111.0,102.0,87.5,85.0,84.5,80.0,79.5,78.0,59.0,57.0,56.0,55.0,51.5,50.0,50.0,46.0,46.0,43.0,38.5,36.5,33.0,30.5,30.5,30.5,29.0,29.0,27.0,24.5,23.5,51,43,45,42,44,49,47,46,49,50,45,45,45,43,46,41,48,50,45,46,45,45,46,45,48,51,48,47,43,49,50,48,48,49,48,47,49,48,53,51,50,50,46,47,47,49,48,44,46,47,48,47,48,46,45,47,48,41,44,43,42,45,43,47,46,44,45,47,44,46,49,42,41,46,45,48,43,45,47,48,45,46,46,47,44,44,46,48,44,47,44,47,45,46,43,46,49,45,47,51,49,51,49,44};

float time = 0.;                  
float speed = 0.05;
PFont f;
float lowestVal;  
float highestVal; 
float spread;  

void setup() {
 

    size(700, 500);
    smooth();
    f = createFont("helvetica", 16, true);
    setUpNormalization();
}

void draw() {
  
    background(60);  
    

    time += speed;                   
    
    int index1 = (int)time % obamaFL.length;    // get integer part of "time", keep it in range
    int index2 = (index1 + 1) % obamaFL.length; // next index
    int index3 = (int)time % obamaOH.length;    // get integer part of "time", keep it in range
    int index4 = (index3 + 1) % obamaOH.length;
    float interp = time - (int)time;       // get fractional part of "time"
    
    float daycolor = daysFL[index1] + interp * (daysFL[index2] - daysFL[index1]);
    daycolor = (309. - daycolor) / 309. * 255.;  // flip range, and scale it to 0 to 255
    
    ////////////////   OBAMA FL
    float obamafl = obamaFL[index1] + interp * (obamaFL[index2] - obamaFL[index1]);
    obamafl = normalizePrez(obamafl);
    float ypos1 = obamafl / 2.; // 100 points in poll, 400 pixels = height
    stroke(150);
    strokeWeight(8);
    fill(0, 205, 185, daycolor);
    ellipse(width/2+ypos1, height/2, ypos1/3, ypos1/3); 
    stroke(250);
    strokeWeight(2);
    ellipse(width/2+ypos1, height/2, ypos1/3, ypos1/3); 
    
    ////////////////   ROMNEY FL
    float romneyfl = romneyFL[index1] + interp * (romneyFL[index2] - romneyFL[index1]);
    romneyfl = normalizePrez(romneyfl);
    float ypos2 = romneyfl / 2.; // 100 points in poll, 400 pixels = height
    stroke(150);
    strokeWeight(8);
    fill(255, 0, 120, daycolor);
    ellipse(width/2-ypos2, height/2, ypos2/3, ypos2/3); 
    stroke(250);
    strokeWeight(2);
    ellipse(width/2-ypos2, height/2, ypos2/3, ypos2/3); 
        
    ////////////////   OBAMA OH
    float obamaoh = obamaOH[index3] + interp * (obamaOH[index4] - obamaOH[index3]);
    obamaoh = normalizePrez(obamaoh);
    float ypos3 = obamaoh  / 2.; // 100 points in poll, 400 pixels = height
    stroke(150);
    strokeWeight(8);
    fill(0, 205, 185, daycolor);
    ellipse(width/2, height/2+ypos3, ypos3/3, ypos3/3); 
    stroke(250);
    strokeWeight(2);
    ellipse(width/2, height/2+ypos3, ypos3/3, ypos3/3); 
    
    ////////////////   ROMNEY OH
    float romneyoh = romneyOH[index3] + interp * (romneyOH[index4] - romneyOH[index3]);
    romneyoh = normalizePrez(romneyoh);
    float ypos4 = romneyoh  / 2.; // 100 points in poll, 400 pixels = height
    stroke(150);
    strokeWeight(8);
    fill(255, 0, 120, daycolor);
    ellipse(width/2, height/2-ypos4, ypos4/3, ypos4/3); 
    stroke(250);
    strokeWeight(2);
    ellipse(width/2, height/2-ypos4, ypos4/3, ypos4/3); 
    
    ///////////////  line rect
   line(width/2, height/2-ypos4, width/2-ypos2, height/2);
   line(width/2, height/2+ypos3, width/2+ypos1, height/2);
   line(width/2, height/2-ypos4, width/2+ypos1, height/2);
   line(width/2, height/2+ypos3, width/2-ypos2, height/2);
  // line(width/2, height/2+ypos3, width/2, height/2-ypos4);
  // line(width/2+ypos1, height/2, width/2-ypos2, height/2);
   
    
    ///////////////   text
    textFont(f, 16);
    textAlign(CENTER);
    fill(200);
    text("OBAMA OH", width/2+80, height/2+ypos3);
    text("OBAMA FL", width/2+ypos1+80, height/2);
    text("ROMNEY FL", width/2-ypos2-80, height/2);
    text("ROMNEY OH", width/2-80, height/2-ypos4);
    text("days before election", 100, 60);
    text(daysFL[index1], 56, 80);
    
  
}
float normalizePrez(float _percent){
    
  return (_percent - lowestVal) / spread * 400.0;
  
}

void setUpNormalization(){
   
   float lowest = 100.;
   float highest = 0.;
   
   for(int i = 0; i < obamaFL.length; i++)
   {
       if(obamaFL[i]  < lowest)  lowest  = obamaFL[i];
       if(romneyFL[i] < lowest)  lowest  = romneyFL[i];
       if(obamaFL[i]  > highest) highest = obamaFL[i];
       if(romneyFL[i] > highest) highest = romneyFL[i];
       if(obamaOH[i]  < lowest)  lowest  = obamaOH[i];
       if(romneyOH[i] < lowest)  lowest  = romneyOH[i];
       if(obamaOH[i]  > highest) highest = obamaOH[i];
       if(romneyOH[i] > highest) highest = romneyOH[i];
   }
 
   lowestVal  = lowest;
   highestVal = highest;
   spread = highest - lowest;  
}

/*float lowestVal  = min(all);
float highestVal = max(all);
float spread = highestVal - lowestVal;


void setUpNormalization(){

float spread = highestVal - lowestVal;  

}*/



