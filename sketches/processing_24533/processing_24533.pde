

 void setup(){
  
  size(400,800);
  noLoop();
  //beginRecord(PDF, "first wallpaper.pdf");     
}

void draw(){
//Your code here.
  background(8,2,2);
  fill(147,12,12);//fill RED line 1.
  rect(320,0,20,800);//create RED line 1.
  fill(147,12,12);//fill RED line 2.
  rect(360,0,20,800);//create RED line 2.
  
  fill(44,114,188);//fill Blue rectangle 1.
  rect(0,50,230,65);//create Blue rectangle 1.
  fill(44,114,188);//fill Blue rectangle 2.
  rect(230,90,190,25);////create Blue rectangle 2.
  
  fill(53,142,34);//fill green rectangle 1.
  rect(0,390,800,30);//create green rectangle 1.
  
  fill(224,194,18);//fill yellow triangle 1.
  triangle(230,250,230,110,410,250);//create triangle 1.
  
  fill(53,142,34);//fill green line 1.
  quad(0,210,230,115,230,120,0,215);//create green line 1.
  fill(53,142,34);//fill green line 2.
  quad(0,230,230,130,230,135,0,235);//fill green line 2.
  fill(53,142,34);//fill green line 3.
  quad(0,250,230,145,230,150,0,255);//fill green line 3.
  
  fill(44,114,188);//fill blue triangle 1.
  triangle(190,420,300,420,245,490);//create blue triangle 1.
  fill(44,114,188);//fill blue triangle 2.
  triangle(180,550,225,480,275,550);//create blue triangle 2.

  fill(147,12,12);//fill red rectangle 2.
  rect(120,555,200,20);//create red rectangle 2.
  fill(147,12,12);//fill red rectangle 2.
  rect(220,575,20,225);//create red rectangle 2.
  
  fill(224,194,18);// fill yellow rectangle 3.
  quad(65,520,190,420,216, 453, 95, 555);//create yellow rectangle 3.

  fill(53,142,34);//fill green circle 1.
  ellipse(50,560,70,70);//create green circle 1.

  //endRecord();
}



