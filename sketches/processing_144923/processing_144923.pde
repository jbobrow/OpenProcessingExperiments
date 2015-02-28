
float counter = 0;
float fadein = 0;
int frvar = 50;
float griddist = 45;
float letterypos = 3*griddist;
float letterxpos = .5*griddist;
float letterscalem = 0;
float letterscalej = 0;
float letterscaler = 0;
float scalevar = .1;

void setup(){
  size(450,450);
  frameRate(frvar);
  colorMode(HSB);
}

void draw(){
  int x = random(10);
  int gridx = 0; //dev purposes only
  int gridy = 0; //dev purposes only
  
  noStroke();
  if(counter <= 9){
  background(0); }
  
  // Background -> White sequence
  if(counter >= 8){
      fill(255,fadein);
      rect(0,0,width,width);
      fadein += 2;
    }
    
     // MJR Logo  
  if(counter > 10){
    scale(letterscalem);
      if(counter > 21){
       if(counter < 23){
      for(i = 0; i < width/4; i += width/4){
      letterxpos = griddist + random(6);
    }}}
  if(counter < 21){ 
    fill(0); }
    else{
    fill(random(360),random(100),random(100),random(255));}
    beginShape();  //Letter M
    vertex(letterxpos, letterypos);
    vertex(letterxpos+griddist, letterypos);
    vertex(letterxpos+1.5*griddist, letterypos+2.5*griddist);
    vertex(letterxpos+2*griddist, letterypos);
    vertex(letterxpos+3*griddist, letterypos);
    vertex(letterxpos+3*griddist, letterypos+4*griddist);
    vertex(letterxpos+2.25*griddist, letterypos+4*griddist);
    vertex(letterxpos+2.25*griddist, letterypos+1*griddist);
    vertex(letterxpos+1.5*griddist, letterypos+4*griddist);
    vertex(letterxpos+.75*griddist,letterypos+griddist);
    vertex(letterxpos+.75*griddist, letterypos+4*griddist);
    vertex(letterxpos, letterypos+4*griddist);
    endShape();
    
if(counter <= 10+(10*(1/frvar))){
    letterscalem += scalevar;
}}

  if (counter > 12){
    scale(letterscalej);
      if(counter > 21){
       if(counter < 23){
      for(i = 0; i < width/4; i += width/4){
      letterxpos = griddist + random(6);
    }}}
  beginShape();  //Letter J
    vertex(letterxpos+3.125*griddist, letterypos);
    vertex(letterxpos+5.875*griddist, letterypos);
    vertex(letterxpos+5.875*griddist, letterypos+griddist);
    vertex(letterxpos+5*griddist, letterypos+griddist);
    vertex(letterxpos+5*griddist, letterypos+3*griddist);
    vertex(letterxpos+4.5*griddist, letterypos+4*griddist);
    vertex(letterxpos+3.5*griddist, letterypos+4*griddist);
    vertex(letterxpos+3.125*griddist, letterypos+2.5*griddist);
    vertex(letterxpos+4*griddist, letterypos+3*griddist);
    vertex(letterxpos+4*griddist, letterypos+griddist);
    vertex(letterxpos+3.125*griddist, letterypos+griddist);
  endShape();
if(counter <= 12+(10*(1/frvar))){
    letterscalej += scalevar;
}}
  
  if (counter > 14){
    scale(letterscaler);
     if(counter > 21){
       if(counter < 23){
      for(i = 0; i < width/4; i += width/4){
      letterxpos = griddist + random(6);
      beginShape(); //Glitched letter R
    vertex(letterxpos+6*griddist, letterypos);
    vertex(letterxpos+6.5*griddist, letterypos);
    vertex(letterxpos+6.5*griddist, letterypos+2*griddist);
    vertex(letterxpos+7*griddist, letterypos+2*griddist);
    vertex(letterxpos+8*griddist, letterypos+1.5*griddist);
    vertex(letterxpos+7*griddist, letterypos+.75*griddist);
    vertex(letterxpos+7*griddist, letterypos);
    vertex(letterxpos+9*griddist,letterypos+1.5*griddist);
    vertex(letterxpos+7.5*griddist, letterypos+2.5*griddist);
    vertex(letterxpos+9*griddist, letterypos+4*griddist);
    endShape();
    }}}
  else{
    beginShape(); //Letter R
    vertex(letterxpos+6*griddist, letterypos);
    vertex(letterxpos+6.75*griddist, letterypos);
    vertex(letterxpos+6.75*griddist, letterypos+2*griddist);
    vertex(letterxpos+7.25*griddist, letterypos+2*griddist);
    vertex(letterxpos+8*griddist, letterypos+1.5*griddist);
    vertex(letterxpos+7.25*griddist, letterypos+.75*griddist);
    vertex(letterxpos+6.5*griddist, letterypos+.75*griddist);
    vertex(letterxpos+6.5*griddist, letterypos);
    vertex(letterxpos+7.5*griddist, letterypos);
    vertex(letterxpos+9*griddist,letterypos+1.5*griddist);
    vertex(letterxpos+7.5*griddist, letterypos+2.5*griddist);
    vertex(letterxpos+9*griddist, letterypos+4*griddist);
    vertex(letterxpos+8*griddist, letterypos+4*griddist);
    vertex(letterxpos+6.75*griddist, letterypos+2.5*griddist);
    vertex(letterxpos+6.75*griddist, letterypos+4*griddist);
    vertex(letterxpos+6*griddist, letterypos+4*griddist);
    endShape();
    if(counter <= 14+(10*(1/frvar))){
    letterscaler += scalevar;
}}}

noFill();
  
  // Videotape tracking mockery
  if(counter > 3){
    if(counter < 8){
  for (int i = 51; i <= 255; i += random(51)){
    fill(0,0,random(75,100), i);
    rect(0,random(width/2.25),width,x);
  }}}
  
  //Videotape static mockery
  if(counter > 5){    
  for (int i = 0; i <= 350; i ++){    
    stroke(150);
    strokeWeight(2);
    point(random(width),random(width));
    noStroke(); 
    }
}
  if(counter > 15){
    for (int i = 0; i <= 350; i ++){  
    if (counter > 17){
      if (counter < 20){
      stroke(random(360),random(1,99),random(1,99)); }}  
    else{stroke(150);}
    strokeWeight(random(15));
    point(random(width),random(width));
    noStroke(); 
    }}
  if(counter >= 20){    
  for (int i = 0; i <= 350; i ++){    
    stroke(150);
    strokeWeight(2);
    point(random(width),random(width));
    noStroke(); 
    }}
    
 counter += 1/frvar;

 //grid (for development only.. on second thought, after a mistake this will be used)
 if(counter > 21){
   if(counter < 23){
 for(i = 0; i < width/4; i += width/10){
   stroke(random(50,310),random(100),random(100));
   strokeWeight(3);
   line(x,0,x,width);                // Do this with 'x' instead of 'gridx'.
   x += 20;  
   noStroke();
 }}}
  /* y-grid (dev)
  for(i = 0; i < width; i += width/10){      
   stroke(0);
   strokeWeight(3);
   line(0,gridy,width,gridy);                
   gridy += width/10;  
   noStroke();
 }
 */
   
}


