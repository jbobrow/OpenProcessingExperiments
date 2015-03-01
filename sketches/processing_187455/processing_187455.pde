
//selfie 01

void setup(){
  smooth ();
  size(600,1000);
  background(#b3394f);
}

void draw(){
  
  if (mousePressed == true) {
    //bg
    background(#303B8C);
   
    //legs
  fill(#69C8F4);
  noStroke();
  triangle(300,870, 300,1000, 230,878);
  fill(#57AAC1);
  triangle(300,870, 300,1000, 357,882);
  
  //  haloback
  strokeWeight(10);
  stroke(#FFFF80);
  line(296,90, 450,176);
  
  //body
  noStroke();
  fill(#5B5B5B);
  quad(200,740, 200,896, 315,964, 315,760);
  fill(240);
  triangle(235,823, 200,739, 316,792);
  fill(#494949);
  quad(315,984, 315,780, 415,720, 415,924);
  quad(296,720, 296,974, 315,984, 315,740);
  quad(200,720, 200,916, 210,924, 210,720);
  
  //base
  smooth();
  noStroke();
  fill(#80DEFF);
  quad(100,252, 300,360, 300,800, 100,686);
  fill(#69C8F4);
  quad(300,360, 300,800, 500,686, 500,252);
  fill(250);
  quad(100,252, 300,360, 500,252, 300,138);
  
  //face
  stroke(5);
  strokeWeight(12);
  point(243,496);
  point(146,441);
   
  noStroke();
  fill(#ff6464);
  triangle(180,482, 180,582, 162,582);
  fill(#ef5050);
  ellipse(162,582, 36, 36);
  
  
  //beard
  fill(5, 90);
  triangle(180,654, 148,713, 210,749);
  triangle(170,726, 300,590, 300,800);
  triangle(170,726, 100,520, 100,686);
  triangle(248,643, 178,602, 129,607);
  
  //eyebrows
  strokeWeight(2);
  stroke(250);
  line(220,476, 269,479);
  line(164,420, 137,406);
  
 
  
  //bangs
  noStroke();
  fill(250);
  triangle(100,252, 100,310, 233,322);
  triangle(100,252, 100,340, 140,312);
  triangle(194,310, 360,466, 412,356);
  
  
  
  
  //hair
  noStroke();
  fill(250);
  triangle(386,540, 360,466, 412,356);
  triangle(500,592, 500,252, 408,386);
  triangle(500,252, 300,360, 408,386);
  triangle(408,386, 390,440, 430,420);
  triangle(100,252, 200,158, 200,210);
  triangle(320,150, 380,140, 370,195);
  triangle(233,176, 330,110, 332,215);
  triangle(500,250, 463,374, 360,462);
  triangle(500,250, 295,290, 360,462);
  
  //sidebeard
  fill(5, 90);
  triangle(300,590, 300,800, 384,538);
  
  //ear
  fill(#ffaf50);
  ellipse(424,468, 30,100);
  ellipse(424,509, 30,30);
  
  //mouth
  noStroke();
  fill(#FF8A8A);
  ellipse(178,656, 40,20);
  ellipse(174,651, 28,16);
  ellipse(180,658, 20,16);
  
  //halo
  strokeWeight(10);
  stroke(#FFFF80);
  line(296,265, 140,178);
  line(140,178, 296,90);
  
  line(450,176, 296,265);

  }
  
  
  
  
  
  else {
    //bg
    background(#b3394f);
    
    //legs
  fill(#69C8F4);
  noStroke();
  triangle(300,870, 300,1000, 230,878);
  fill(#57AAC1);
  triangle(300,870, 300,1000, 357,882);
  
  //  haloback
  strokeWeight(10);
  stroke(250);
  line(296,90, 450,176);
  
  //body
  noStroke();
  fill(#5B5B5B);
  quad(200,740, 200,896, 315,964, 315,760);
  fill(240);
  triangle(235,823, 200,739, 316,792);
  fill(#494949);
  quad(315,984, 315,780, 415,720, 415,924);
  quad(296,720, 296,974, 315,984, 315,740);
  quad(200,720, 200,916, 210,924, 210,720);
  
  //base
  smooth();
  noStroke();
  fill(#ffff80);
  quad(100,252, 300,360, 300,800, 100,686);
  fill(#f4f069);
  quad(300,360, 300,800, 500,686, 500,252);
  fill(5);
  quad(100,252, 300,360, 500,252, 300,138);
  
  //face
  stroke(5);
  strokeWeight(12);
  point(243,496);
  point(146,441);
   
  noStroke();
  fill(#ff6464);
  triangle(180,482, 180,582, 162,582);
  fill(#ef5050);
  ellipse(162,582, 36, 36);
  
  
  //beard
  fill(5, 90);
  triangle(180,654, 148,713, 210,749);
  triangle(170,726, 300,590, 300,800);
  triangle(170,726, 100,520, 100,686);
  triangle(248,643, 178,602, 129,607);
  
  //eyebrows
  strokeWeight(2);
  stroke(0);
  line(220,476, 269,479);
  line(164,420, 137,406);
  
 
  
  //bangs
  noStroke();
  fill(5);
  triangle(100,252, 100,310, 233,322);
  triangle(100,252, 100,340, 140,312);
  triangle(194,310, 360,466, 412,356);
  
  
  
  
  //hair
  noStroke();
  fill(5);
  triangle(386,540, 360,466, 412,356);
  triangle(500,592, 500,252, 408,386);
  triangle(500,252, 300,360, 408,386);
  triangle(408,386, 390,440, 430,420);
  triangle(100,252, 200,158, 200,210);
  triangle(320,150, 380,140, 370,195);
  triangle(233,176, 330,110, 332,215);
  triangle(500,250, 463,374, 360,462);
  triangle(500,250, 295,290, 360,462);
  
  //sidebeard
  fill(5, 90);
  triangle(300,590, 300,800, 384,538);
  
  //ear
  fill(#ffaf50);
  ellipse(424,468, 30,100);
  ellipse(424,509, 30,30);
  
  //mouth
  noStroke();
  fill(#FF8A8A);
  ellipse(178,656, 40,20);
  ellipse(174,651, 28,16);
  ellipse(180,658, 20,16);
  
  //halo
  strokeWeight(10);
  stroke(250);
  line(296,265, 140,178);
  line(140,178, 296,90);
  
  line(450,176, 296,265);

   
  }
  
 
  
}




