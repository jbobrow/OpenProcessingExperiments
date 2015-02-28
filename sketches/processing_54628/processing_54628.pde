
float Lslide = 320;
float Rslide = 320;
float mid = 320;
boolean dir = true;



void setup (){
  size (640,500);
  smooth();
}

void draw(){
  background(255);
  
  if (dir==true)
  {
  
  //top circle
  ellipse(Lslide,50,100,100);
  noStroke();
  fill(#E0DE8F);

  
  //top circle2
  ellipse(Rslide,50,100,100);
  noStroke();
  fill(#CCB76F);
  
 
  
  
  
  
  //2nd circle
  ellipse(Lslide,150,100,100);
  noStroke();
  fill(#CCB76F);
  
  //2nd circle2
  ellipse(Rslide,150,100,100);
  noStroke();
  fill(#B27B3E);
  
  
  
 
  
    //3rd circle
  ellipse(Lslide,250,100,100);
  noStroke();
  fill(#B27B3E);
  
  //3rd circle2
  ellipse(Rslide,250,100,100);
  noStroke();
  fill(#A84D33);
  
  
  
  
  
  
      //4th circle
  ellipse(Lslide,350,100,100);
  noStroke();
  fill(#A84D33);
  
  //4th circle2
  ellipse(Rslide,350,100,100);
  noStroke();
  fill(#573930);
  
  
  
  
  
  
        //5th circle
  ellipse(Lslide,450,100,100);
  noStroke();
  fill(#573930);
  
  //5th circle2
  ellipse(Rslide,450,100,100);
  noStroke();
  fill(#E0DE8F);


  
  if (Lslide<51)
  {
  dir=false;
}
  
  
  
  
  
  
  Lslide -= 2;
  Rslide += 2;
 
  
  }else{
    
      //top circle
  ellipse(Lslide,50,100,100);
  noStroke();
  fill(#E0DE8F);

  
  //top circle2
  ellipse(Rslide,50,100,100);
  noStroke();
  fill(#CCB76F);
  
 
  
  
  
  
  //2nd circle
  ellipse(Lslide,150,100,100);
  noStroke();
  fill(#CCB76F);
  
  //2nd circle2
  ellipse(Rslide,150,100,100);
  noStroke();
  fill(#B27B3E);
  
  
  
 
  
    //3rd circle
  ellipse(Lslide,250,100,100);
  noStroke();
  fill(#B27B3E);
  
  //3rd circle2
  ellipse(Rslide,250,100,100);
  noStroke();
  fill(#A84D33);
  
  
  
  
  
  
      //4th circle
  ellipse(Lslide,350,100,100);
  noStroke();
  fill(#A84D33);
  
  //4th circle2
  ellipse(Rslide,350,100,100);
  noStroke();
  fill(#573930);
  
  
  
  
  
  
        //5th circle
  ellipse(Lslide,450,100,100);
  noStroke();
  fill(#573930);
  
  //5th circle2
  ellipse(Rslide,450,100,100);
  noStroke();
  fill(#E0DE8F);
  
  
    Lslide += 2;
  Rslide -= 2;  
  

  if (Lslide>319)
  {
  dir=true;
}
  
}




}


