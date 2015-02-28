
 color b = color(0);  // brush color

void setup(){
  size(1000,1000);
  background(230);
  noStroke();
 fill(200);
    rect(75,45,890,930);
  fill(255);
  rect(70,40,890,930);
    
  smooth();


}

 

void draw()
{
  if(mousePressed && mouseX > 75 && mouseX < 965&&mouseY>45&&mouseY<975){
stroke(b);
 line(mouseX,mouseY,pmouseX,pmouseY);
 }
 else
 {noStroke();

 }
  
  noStroke();
  fill(255,247,171);  // light yellow
  rect(10,970,20,20);
  

  fill(255,245,104);  
  rect(10,949,20,20);
  
  fill(255,242,0); 
  rect(10,928,20,20);
  
 
  fill(247,148,29); 
  rect(10,907,20,20);

  fill(247,101,34);
  rect(10,886,20,20);  
  
  fill(237,28,36);
  rect(10,865,20,20); //6 
  
  fill(158,11,15);
  rect(10,844,20,20); 
   
  fill(122,0,38);
  rect(10,823,20,20); 
  
  fill(158,0,93);//146,39,143
  rect(10,802,20,20); 
 
  fill(236,0,140);//102,45,145
  rect(10,781,20,20); 
  
  fill(240,110,170);//white rect
  rect(10,760,20,20); 
  
  fill(244,152,197);//white rect
  rect(10,739,20,20); 
  
  fill(189,140,191);//white rect
  rect(10,718,20,20); 
  
  fill(133,96,168);//white rect
  rect(10,697,20,20); 
  
  fill(96,92,168);//white rect
  rect(10,676,20,20); 
  
  fill(49,49,146);//white rect
  rect(10,655,20,20); 
  
  fill(27,20,100);//white rect
  rect(10,634,20,20); 
  
  fill(0,52,113);//white rect
  rect(10,613,20,20); 
 
  fill(0,84,165);//white rect
  rect(10,592,20,20); 
  
  fill(0,74,239);//white rect
  rect(10,571,20,20); 
  
  fill(0,114,188);//white rect
  rect(10,550,20,20); 
  
  fill(0,169,157);//white rect
  rect(10,529,20,20); 
  
  fill(28,187,180);//white rect
  rect(10,508,20,20); 
  
  fill(122,204,200);//white rect
  rect(10,487,20,20); 
  
  fill(130,202,156);//white rect
  rect(10,466,20,20); 
  
  fill(60,184,120);//white rect
  rect(10,445,20,20); 
  
  fill(57,181,74);//black rect
  rect(10,424,20,20);
  
  fill(141,198,63);//black rect
  rect(10,403,20,20);
  
  fill(25,123,48);//black rect
  rect(10,382,20,20);
  
  fill(0,64,38);//black rect
  rect(10,361,20,20);
  
  fill(0);//black rect
  rect(10,340,20,20); 
  
  fill(30);//black rect
  rect(10,319,20,20); 
  
  fill(60);//black rect
  rect(10,298,20,20); 
  
  fill(90);//black rect
  rect(10,277,20,20); 
  
  fill(120);//
  rect(10,256,20,20); 
  
  fill(150);//
  rect(10,235,20,20); 
  
  fill(180);//
  rect(10,214,20,20); 
  
  fill(210);//
  rect(10,193,20,20); 
  
  fill(240);//
  rect(10,172,20,20); 
  
  fill(255);//white
  rect(10,151,20,20);
  
  
  
  fill(0);
  rect(10,10,20,10);//point 10
  
  fill(0);
  rect(10,21,20,20);//point20
  
  fill(0);
  rect(10,42,20,30);//point 30
  
   fill(0);
  rect(10,73,20,40);//point 40
  
  
// if(mousePressed&&mouseX> leftt&&mouseX< right  if(mousePressed&&mouseX>10&&mouseX<20&&mouseY>970&&mouseY<990) // red button
   if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>970&&mouseY<990) // red button
  {
   b = color(255,247,171); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>949&&mouseY<969) // red button
  {
  b = color(255,245,104); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>928&&mouseY<948) // red button
  {
  b = color(255,242,0); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>907&&mouseY<927) // red button
  {
  b = color(247,148,29); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>886&&mouseY<906) // red button
  {
  b = color(247,101,34); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>865&&mouseY<885) // red button
  {
  b = color(237,28,36); 
  }//6


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>844&&mouseY<864) // red button
  {
  b = color(158,11,15); 
  }

   if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>823&&mouseY<843) // red button
  {
  b = color(122,0,38); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>802&&mouseY<822) // red button
  {
  b = color(158,0,93); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>781&&mouseY<801) // red button
  {
  b = color(236,0,140); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>760&&mouseY<780) // red button
  {
  b = color(240,110,170); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>739&&mouseY<759) // red button
  {
  b = color(244,152,197); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>718&&mouseY<738) // red button
  {
  b = color(189,140,191); 
  }
  
   if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>697&&mouseY<717) // red button
  {
   b = color(133,96,168); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>676&&mouseY<696) // red button
  {
  b = color(96,92,168); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>655&&mouseY<675) // red button
  {
  b = color(49,49,146); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>634&&mouseY<654) // red button
  {
  b = color(27,20,100); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>613&&mouseY<633) // red button
  {
  b = color(0,52,113); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>595&&mouseY<615) // red button
  {
  b = color(0,84,165); 
  }

 if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>571&&mouseY<591) // red button
  {
   b = color(0,74,23); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>550&&mouseY<570) // red button
  {
  b = color(0,114,188); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>529&&mouseY<549) // red button
  {
  b = color(0,169,157); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>508&&mouseY<528) // red button
  {
  b = color(28,187,180); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>487&&mouseY<507) // red button
  {
  b = color(122,204,200); 
  }

if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>466&&mouseY<486) // red button
 {
 b = color(130,202,156); 
 }//6

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>445&&mouseY<465) // red button
  {
  b = color(60,184,120); 
  }
  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>424&&mouseY<444) // red button
  {
  b = color(57,181,74); 
  }
  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>403&&mouseY<423) // red button
  {
  b = color(141,198,63); 
  }
  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>382&&mouseY<402) // red button
  {
  b = color(25,123,48); 
  }
  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>361&&mouseY<381) // red button
  {
  b = color(0,64,38); 
  }

 if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>340&&mouseY<360) // red button
  {
   b = color(0); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>319&&mouseY<339) // red button
  {
  b = color(30); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>298&&mouseY<318) // red button
  {
  b = color(60); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>277&&mouseY<297) // red button
  {
  b = color(90); 
  }


  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>256&&mouseY<276) // red button
  {
  b = color(120); 
  }

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>235&&mouseY<255) // red button
  {
  b = color(150); 
  }//6

  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>214&&mouseY<234) // red button
  {
  b = color(180); 
  }
  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>193&&mouseY<213) // red button
  {
  b = color(210); 
  }
  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>172&&mouseY<192) // red button
  {
  b = color(240); 
  }
  if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>151&&mouseY<171) // red button
  {
  b = color(255); 
  }

//
 
  


if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>10&&mouseY<20){

if (mousePressed){
  strokeWeight(10);
   line(mouseX,mouseY,pmouseX,pmouseY);
}
}

if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>21&&mouseY<41){

if (mousePressed){
  strokeWeight(20);
   line(mouseX,mouseY,pmouseX,pmouseY);
}
}

if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>42&&mouseY<72){

if (mousePressed){
  strokeWeight(30);
   line(mouseX,mouseY,pmouseX,pmouseY);
}
}

if(mousePressed&&mouseX>10&&mouseX<30&&mouseY>73&&mouseY<113){

if (mousePressed){
  strokeWeight(40);
   line(mouseX,mouseY,pmouseX,pmouseY);
}
}
}
                
                
