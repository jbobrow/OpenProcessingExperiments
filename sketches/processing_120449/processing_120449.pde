
int eSize = 3;



size(400,565);
background(0,0,0);
smooth();


//tixyouhoukei
fill(255);
quad(0,200,200,380,400,200,200,240);

//amimejounosen
for(int y = 280; y <= height; y +=20){
line(0,200, 400,y);
  }

for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
  }
 
 //uenomaru 
 ellipse(200,0,100,100);
 
 //sitanomaru
 ellipse(200,565,100,100);
 
 //amimejounosen
 quad(0,250,0,560,200,380,200,240);
 quad(200,380,200,240,400,250,400,560);
 for(int y = 280; y <= height; y +=20){
line(0,200, 400,y);
  }

for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
  }
  
//sitazi  
fill(0);
triangle(200,380,0,565,400,565);
triangle(200,380,0,560,400,560);
triangle(200,380,0,562,400,562);
triangle(200,380,0,563,400,563);


fill(255);
 ellipse(200,565,100,100);
 

//amimejounosen
fill(255);
quad(0,200,200,380,400,200,200,240);

for(int y = 280; y <= height; y +=20){
line(0,200, 400,y);
  }

for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
  }
  
 ellipse(200,0,100,100);
 
 ellipse(200,565,100,100);
 
 quad(0,250,0,560,200,380,200,240);
 quad(200,380,200,240,400,250,400,560);
 for(int y = 280; y <= height; y +=20){
line(0,200, 400,y);
  }

for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
  }


fill(255);
 ellipse(200,565,100,100);
 

 
 

//ueniarusen
for(int y = 0; y<=height; y += 20){
  for(int x = 0; x<=width; x += 20){
  if(x > 100 && x <= 200 && y > 300 && y <300){fill(255);
  line(x,y, 200, 0);
  }else{
    stroke(255,0,0);
  }
   line(x,y, 200, 0);
}
}



 fill(0);
triangle(200,380,0,565,400,565);
triangle(200,380,0,560,400,560);
triangle(200,380,0,562,400,562);
triangle(200,380,0,563,400,563);


//sitaniarusen
for(int y = 300; y<=height; y += 20){
  for(int x = 0; x<=width; x += 20){
  if(x > 100 && x <= 200 && y > 300 && y <300){fill(255);
  line(x,y, 200, 565);
  }else{
    stroke(255,255,0);
  }
   line(x,y, 200, 565);
}
}



stroke(0); 


//amimejounosen
fill(255);
for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
  }
 fill(255,0,0); 
 ellipse(200,0,100,100);
 fill(255,255,0);
 ellipse(200,565,100,100);
 
 //amimejounosen
 fill(255);
 quad(0,250,0,560,200,380,200,240);
 quad(200,380,200,240,400,250,400,560);
 for(int y = 280; y <= height; y +=20){
line(0,200, 400,y);
  }

for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
}

fill(255);
quad(0,200,200,380,400,200,200,240);

for(int y = 280; y <= height; y +=20){
line(0,200, 400,y);
  }
  
for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
  }  
  
 fill(0);
stroke(255);

//sitazi 
stroke(0);
quad(250,0,150,0,150,565,250,565);


//sitazi
stroke(0);;
quad(200,380,200,240,400,200,400,560); 
  quad(0,200,0,560,200,380,200,240);
  
stroke(255);

//kaidanjounisurutamenosikaku 
stroke(0);
 fill(0);
 quad(20,560,60,550,300,290,260,335);
 quad(60,550,100,540,200,410,260,335);
 quad(100,540,140,530,190,440,200,410);
 quad(140,530,160,530,220,460,190,440);
 quad(0,560,20,565,400,200,400,200);
 
 //kaidanjounisurutamenosikaku
 stroke(0);
 fill(0);
 quad(400,200,390,195,50,230,30,250);
 quad(390,195,385,190,70,210,50,230);
 quad(385,190,380,185,90,190,70,210);
 quad(380,185,370,175,130,150,90,190);
 quad(370,175,350,165,170,110,130,150);
 quad(350,165,340,130,175,100,170,110);
 quad(340,130,290,100,180,90,175,100);
 quad(290,100,270,80,175,80,180,90);
 quad(270,80,230,60,190,60,175,80);
 quad(400,200,400,200,0,280,0,255);
 
 
//hidarigawanomaru 
 stroke(255);
ellipse(380,270,10,10); 
ellipse(355,310,40,40); 
ellipse(315,370,70,70); 


//amimejounosen 
stroke(255); 
 for(int y = 280; y <= height; y +=20){
line(0,200, 400,y);
  }

//hidarigawanomaru  
 fill(0); 
 stroke(255);
for(int i=200; i<350; i+=30) {    
  ellipse(i-250, i, i-250, i-250);    
}



//amimejounosen
stroke(255);
for(int y = 280; y <= height; y +=20){
line(400, 200, 0,y);
} 


//migigawanomaru
 stroke(0);
 fill(255,0,0); 
 ellipse(200,0,100,100);
 stroke(0);
 fill(255,255,0);
 ellipse(200,565,100,100);
 
 stroke(0);
 fill(0);
 
 //kaidanjounosen
 stroke(255);
 line(20,560,300,290);
 line(60,550,260,335);
 line(100,540,200,410);
 line(140,530,190,440);
 line(160,530,220,460);
 line(162,535,215,500);
 line(165,540,200,520);
 
 line(400,200,30,250);
 line(390,195,50,230);
 line(385,190,70,210);
 line(380,185,90,190);
 line(370,175,130,150);
 line(350,165,170,110);
 line(340,130,175,100);
 line(180,90,290,100);
 line(175,80,270,80);
 line(190,60,230,60);
 

 


