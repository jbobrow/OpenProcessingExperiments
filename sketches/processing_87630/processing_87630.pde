
float X=0;
float Y=0;

void setup() {

  size (400, 400);
  frameRate (30);
  smooth();
}

void draw() {
  translate (width/2, height/2-15);

pushMatrix();  //Pied Gauche
  stroke(155,22,139);
  strokeWeight(1);
  fill(155,22,139);
  translate(X-190, Y-170);
  beginShape();
  curveVertex(150, 353 );
  curveVertex( 150, 351 );
  curveVertex( 151, 348 );
  curveVertex (151, 346 );
  curveVertex( 150, 345 );
  curveVertex( 149, 344 );
  curveVertex( 148, 343 );
  curveVertex( 147, 343 );
  curveVertex( 145, 342 );
  curveVertex( 143, 342 );
  curveVertex( 141, 343 );
  curveVertex( 140, 344 );
  curveVertex( 139, 346 );
  curveVertex( 138, 348 );
  curveVertex( 136, 350 );
  curveVertex( 134, 351 );
  curveVertex( 132, 353 );
  curveVertex( 130, 355 );
  curveVertex( 128, 357 );
  curveVertex( 128, 357 );
  curveVertex( 127, 357 );
  curveVertex( 126, 357 );
  curveVertex( 125, 358 );
  curveVertex( 125, 358 );
  curveVertex( 125, 359 );
  curveVertex( 125, 361 );
  curveVertex( 125, 362 );
  curveVertex( 126, 362 );
  curveVertex( 126, 362 );
  curveVertex( 127, 362 );
  curveVertex( 126, 363 );
  curveVertex( 126, 364 );
  curveVertex( 126, 365 );
  curveVertex( 126, 366 );
  curveVertex( 127, 367 );
  curveVertex( 128, 367 );
  curveVertex( 129, 367 );
  curveVertex( 130, 367 );
  curveVertex( 130, 367 );
  curveVertex( 130, 367 );
  curveVertex( 130, 367 );
  curveVertex( 129, 368 );
  curveVertex( 129, 370 );
  curveVertex( 130, 371 );
  curveVertex( 130, 372 );
  curveVertex( 131, 372 );
  curveVertex( 132, 373 );
  curveVertex( 133, 373 );
  curveVertex( 135, 372 );
  curveVertex( 135, 372 );
  curveVertex( 136, 371 );
  curveVertex( 136, 372 );
  curveVertex( 136, 374 );
  curveVertex( 137, 375 );
  curveVertex( 139, 377 );
  curveVertex( 141, 377 );
  curveVertex( 142, 377 );
  curveVertex( 144, 377 );
  curveVertex( 146, 377 );
  curveVertex( 147, 376 );
  curveVertex( 148, 375 );
  curveVertex( 149, 373 );
  curveVertex( 149, 371 );
  curveVertex( 149, 369 );
  curveVertex( 148, 368 );
  curveVertex( 148, 367 );
  curveVertex( 149, 366 );
  curveVertex( 149, 364 );
  curveVertex( 149, 361 );
  curveVertex( 149, 358 );
  curveVertex( 149, 356 );
  curveVertex( 150, 353 );
  endShape(CLOSE);
  popMatrix();

  pushMatrix();              //Pied droit
  fill(155,22,139);
  translate(X-200, Y-170);
  beginShape();
  curveVertex(267, 359 );
  curveVertex( 266, 358 );
  curveVertex( 265, 357 );
  curveVertex( 264, 357 );
  curveVertex( 263, 357 );
  curveVertex( 261, 354 );
  curveVertex( 260, 353 );
  curveVertex( 259, 352 );
  curveVertex( 258, 351 );
  curveVertex( 257, 350 );
  curveVertex( 255, 349 );
  curveVertex( 254, 348 );
  curveVertex( 254, 348 );
  curveVertex( 253, 345 );
  curveVertex( 251, 344 );
  curveVertex( 250, 343 );
  curveVertex( 249, 342 );
  curveVertex( 247, 342 );
  curveVertex( 246, 342 );
  curveVertex( 245, 343 );
  curveVertex( 244, 343 );
  curveVertex( 242, 344 );
  curveVertex( 241, 345 );
  curveVertex( 241, 347 );
  curveVertex( 241, 349 );
  curveVertex( 241, 350 );
  curveVertex( 242, 352 );
  curveVertex( 242, 353 );
  curveVertex( 242, 355 );
  curveVertex( 242, 356 );
  curveVertex( 242, 358 );
  curveVertex( 243, 359 );
  curveVertex( 243, 361 );
  curveVertex( 243, 362 );
  curveVertex( 243, 364 );
  curveVertex( 243, 365 );
  curveVertex( 243, 366 );
  curveVertex( 243, 367 );
  curveVertex( 244, 368 );
  curveVertex( 243, 369 );
  curveVertex( 243, 370 );
  curveVertex( 243, 372 );
  curveVertex( 243, 373 );
  curveVertex( 244, 375 );
  curveVertex( 245, 376 );
  curveVertex( 247, 377 );
  curveVertex( 248, 377 );
  curveVertex( 250, 377 );
  curveVertex( 251, 377 );
  curveVertex( 253, 376 );
  curveVertex( 255, 375 );
  curveVertex( 255, 374 );
  curveVertex( 255, 373 );
  curveVertex( 256, 372 );
  curveVertex( 256, 371 );
  curveVertex( 257, 372 );
  curveVertex( 258, 373 );
  curveVertex( 259, 373 );
  curveVertex( 260, 373 );
  curveVertex( 261, 372 );
  curveVertex( 262, 372 );
  curveVertex( 262, 371 );
  curveVertex( 262, 370 );
  curveVertex( 262, 369 );
  curveVertex( 262, 368 );
  curveVertex( 262, 367 );
  curveVertex( 261, 367 );
  curveVertex( 261, 367 );
  curveVertex( 262, 367 );
  curveVertex( 263, 367 );
  curveVertex( 264, 367 );
  curveVertex( 265, 367 );
  curveVertex( 265, 366 );
  curveVertex( 266, 365 );
  curveVertex( 266, 365 );
  curveVertex( 266, 364 );
  curveVertex( 265, 363 );
  curveVertex( 265, 362 );
  curveVertex( 265, 362 );
  curveVertex( 266, 362 );
  curveVertex( 267, 361 );
  curveVertex( 267, 359 );
  endShape(CLOSE);
  popMatrix();

for(int i=0; i<=50; i++) {
  noStroke();
  fill(167+i*0.5,25,151+i*0.2);
  ellipse (X, Y+30, 170-i, 80-i);    //Corps Torse
  ellipse (X, Y+100, 200-i, 170-i);//Corps Bedaine 
}

  fill(155,22,139);
  ellipse (X, Y+150, 16, 5);    //Nombril

  noFill();
  stroke(155, 22, 139);  //nombril
  strokeWeight(2);
  beginShape();
  curveVertex(X-32.0, Y+126.0);
  curveVertex(X-12.0, Y+152.0);
  curveVertex(X+12.0, Y+152.0);
  curveVertex(X+32.0, Y+126.0);
  endShape();

  pushMatrix();
  noStroke();
  fill(155,22,139);
  translate(X-200, Y-200 );  //Tête
  beginShape();
  curveVertex(88, 72 );
  curveVertex( 87, 72 );
  curveVertex( 84, 74 );
  curveVertex( 83, 74 );
  curveVertex( 83, 74 );
  curveVertex( 83, 74 );
  curveVertex( 82, 75 );
  curveVertex( 81, 76 );
  curveVertex( 79, 77 );
  curveVertex( 78, 78 );
  curveVertex( 78, 78 );
  curveVertex( 77, 79 );
  curveVertex( 76, 79 );
  curveVertex( 76, 80 );
  curveVertex( 73, 83 );
  curveVertex( 72, 83 );
  curveVertex( 72, 84 );
  curveVertex( 72, 84 );
  curveVertex( 71, 85 );
  curveVertex( 71, 85 );
  curveVertex( 70, 86 );
  curveVertex( 69, 88 );
  curveVertex( 67, 90 );
  curveVertex( 67, 92 );
  curveVertex( 66, 94 );
  curveVertex( 65, 95 );
  curveVertex( 64, 98 );
  curveVertex( 64, 98 );
  curveVertex( 64, 98 );
  curveVertex( 60, 115 );
  curveVertex( 51, 147 );
  curveVertex( 55, 177 );
  curveVertex( 82, 196 );
  curveVertex( 85, 197 );
  curveVertex( 86, 197 );
  curveVertex( 86, 197 );
  curveVertex( 86, 197 );
  curveVertex( 86, 197 );
  curveVertex( 86, 197 );
  curveVertex( 93, 199 );
  curveVertex( 93, 199 );
  curveVertex( 100, 200 );
  curveVertex( 106, 201 );
  curveVertex( 196, 209 );
  curveVertex( 285, 201 );
  curveVertex( 292, 200 );
  curveVertex( 299, 199 );
  curveVertex( 310, 196 );
  curveVertex( 337, 177 );
  curveVertex( 341, 147 );
  curveVertex( 327, 98 );
  curveVertex( 327, 98 );
  curveVertex( 327, 98 );
  curveVertex( 326, 95 );
  curveVertex( 326, 94 );
  curveVertex( 326, 94 );
  curveVertex( 326, 94 );
  curveVertex( 325, 91 );
  curveVertex( 325, 91 );
  curveVertex( 324, 91 );
  curveVertex( 324, 91 );
  curveVertex( 324, 90 );
  curveVertex( 323, 88 );
  curveVertex( 322, 86 );
  curveVertex( 321, 85 );
  curveVertex( 321, 85 );
  curveVertex( 321, 85 );
  curveVertex( 321, 85 );
  curveVertex( 320, 84 );
  curveVertex( 320, 84 );
  curveVertex( 320, 84 );
  curveVertex( 319, 83 );
  curveVertex( 319, 83 );
  curveVertex( 319, 83 );
  curveVertex( 316, 79 );
  curveVertex( 315, 79 );
  curveVertex( 315, 79 );
  curveVertex( 314, 79 );
  curveVertex( 314, 78 );
  curveVertex( 313, 77 );
  curveVertex( 312, 76 );
  curveVertex( 311, 76 );
  curveVertex( 311, 76 );
  curveVertex( 311, 76 );
  curveVertex( 308, 74 );
  curveVertex( 308, 74 );
  curveVertex( 308, 74 );
  curveVertex( 307, 74 );
  curveVertex( 307, 74 );
  curveVertex( 307, 74 );
  curveVertex( 304, 72 );
  curveVertex( 304, 72 );
  curveVertex( 304, 72 );
  curveVertex( 304, 72 );
  curveVertex( 303, 72 );
  curveVertex( 303, 72 );
  curveVertex( 302, 72 );
  curveVertex( 302, 72 );
  curveVertex( 302, 72 );
  curveVertex( 300, 71 );
  curveVertex( 299, 71 );
  curveVertex( 299, 71 );
  curveVertex( 299, 71 );
  curveVertex( 297, 70 );
  curveVertex( 88, 72 );
  endShape(CLOSE);
  popMatrix();


  pushMatrix();
  translate(X-200, Y-200);  //Bouche
  stroke(255,255,255);
  strokeWeight(5);
  fill(77,16,70);
  beginShape();
  curveVertex(289, 104 );
  curveVertex( 290, 104 );
  curveVertex( 290, 104 );
  curveVertex( 291, 104 );
  curveVertex( 292, 104 );
  curveVertex( 293, 104 );
  curveVertex( 293, 104 );
  curveVertex( 294, 104 );
  curveVertex( 294, 105 );
  curveVertex( 295, 105 );
  curveVertex( 295, 105 );
  curveVertex( 296, 106 );
  curveVertex( 297, 106 );
  curveVertex( 297, 106 );
  curveVertex( 298, 106 );
  curveVertex( 298, 107 );
  curveVertex( 299, 107 );
  curveVertex( 299, 107 );
  curveVertex( 299, 107 );
  curveVertex( 303, 114 );
  curveVertex( 316, 163 );
  curveVertex( 304, 180 );
  curveVertex( 300, 181 );
  curveVertex( 300, 181 );
  curveVertex( 294, 183 );
  curveVertex( 294, 183 );
  curveVertex( 287, 184 );
  curveVertex( 287, 184 );
  curveVertex( 281, 185 );
  curveVertex( 281, 185 );
  curveVertex( 196, 193 );
  curveVertex( 111, 185 );
  curveVertex( 111, 185 );
  curveVertex( 105, 184 );
  curveVertex( 104, 184 );
  curveVertex( 98, 183 );
  curveVertex( 98, 183 );
  curveVertex( 92, 181 );
  curveVertex( 92, 181 );
  curveVertex( 88, 180 );
  curveVertex( 75, 163 );
  curveVertex( 89, 114 );
  curveVertex( 93, 107 );
  curveVertex( 93, 107 );
  curveVertex( 93, 107 );
  curveVertex( 93, 107 );
  curveVertex( 94, 106 );
  curveVertex( 94, 106 );
  curveVertex( 95, 106 );
  curveVertex( 95, 106 );
  curveVertex( 96, 105 );
  curveVertex( 97, 105 );
  curveVertex( 97, 105 );
  curveVertex( 98, 104 );
  curveVertex( 99, 104 );
  curveVertex( 99, 104 );
  curveVertex( 100, 104 );
  curveVertex( 100, 104 );
  curveVertex( 101, 104 );
  curveVertex( 102, 104 );
  curveVertex( 102, 104 );
  curveVertex( 103, 104 );
  curveVertex( 103, 104 );
  curveVertex( 104, 104 );
  curveVertex( 105, 104 );
  curveVertex( 106, 104 );
  curveVertex( 112, 105 );
  curveVertex( 114, 106 );
  curveVertex( 118, 107 );
  curveVertex( 120, 107 );
  curveVertex( 124, 108 );
  curveVertex( 126, 108 );
  curveVertex( 131, 109 );
  curveVertex( 132, 109 );
  curveVertex( 138, 110 );
  curveVertex( 138, 110 );
  curveVertex( 158, 113 );
  curveVertex( 159, 113 );
  curveVertex( 165, 113 );
  curveVertex( 165, 113 );
  curveVertex( 172, 114 );
  curveVertex( 175, 114 );
  curveVertex( 175, 114 );
  curveVertex( 186, 114 );
  curveVertex( 190, 115 );
  curveVertex( 196, 115 );
  curveVertex( 201, 115 );
  curveVertex( 206, 114 );
  curveVertex( 211, 114 );
  curveVertex( 211, 114 );
  curveVertex( 217, 114 );
  curveVertex( 217, 114 );
  curveVertex( 220, 114 );
  curveVertex( 226, 113 );
  curveVertex( 227, 113 );
  curveVertex( 233, 113 );
  curveVertex( 234, 113 );
  curveVertex( 253, 110 );
  curveVertex( 254, 110 );
  curveVertex( 259, 109 );
  curveVertex( 261, 109 );
  curveVertex( 266, 108 );
  curveVertex( 267, 108 );
  curveVertex( 272, 107 );
  curveVertex( 274, 107 );
  curveVertex( 278, 106 );
  curveVertex( 280, 105 );
  curveVertex( 286, 104 );
  curveVertex( 287, 104 );
  curveVertex( 287, 104 );
  curveVertex( 289, 104 );
  curveVertex( 289, 104 );
  curveVertex( 289, 104 );
  curveVertex( 289, 104 );
  endShape(CLOSE);
  popMatrix();

pushMatrix();
translate(X+0,Y+15);
   //Yeux
   noStroke();
   fill(155,22,139);
   ellipse(X-108,Y-140,40,40); 
   fill(255, 255, 255);
   ellipse(X-108, Y-140, 30, 30);
   fill(0);
   ellipse(X-105,Y-149,15,15);
  
   fill(155,22,139);
   ellipse(X-97,Y-167,37,37); 
   fill(255, 255, 255);
   ellipse(X-97, Y-167, 26, 26);
   fill(0);
   ellipse(X-100,Y-167,12,12);
   
   fill(155,22,139);
   ellipse(X-73,Y-175,27,27); 
   fill(255, 255, 255);
   ellipse(X-73, Y-175, 18, 18);
   fill(0);
   ellipse(X-77,Y-180,7,7);
   
   fill(155,22,139);
   ellipse(X-74,Y-148,37,37); 
   fill(255, 255, 255);
   ellipse(X-74, Y-148, 26, 26);
   fill(0);
   ellipse(X-80,Y-150,15,15);
  
   fill(155,22,139);
   ellipse(X-57,Y-125,32,32); 
   fill(255, 255, 255);
   ellipse(X-57, Y-125, 21, 21);
   fill(0);
   ellipse(X-50,Y-130,12,12);
  
  fill(155,22,139);
   ellipse(X-50,Y-178,40,40); 
   fill(255, 255, 255);
   ellipse(X-50, Y-178, 30, 30);
   fill(0);
   ellipse(X-58,Y-180,15,15);
  
    fill(155,22,139);
   ellipse(X-47,Y-148,30,30); 
   fill(255, 255, 255);
   ellipse(X-47, Y-148, 20, 20);
   fill(0);
   ellipse(X-50,Y-150,15,15);
  
    fill(155,22,139);
   ellipse(X-20,Y-133,30,30); 
   fill(255, 255, 255);
   ellipse(X-20, Y-133, 20, 20);
   fill(0);
   ellipse(X-22,Y-140,10,10);
  
   fill(155,22,139);
   ellipse(X-26,Y-150,15,15); 
   fill(255, 255, 255);
   ellipse(X-26, Y-150, 10, 10);
   fill(0);
   ellipse(X-22,Y-153,5,5);
   
   fill(155,22,139);
   ellipse(X-30,Y-162,15,15); 
   fill(255, 255, 255);
   ellipse(X-30, Y-162, 10, 10);
   fill(0);
   ellipse(X-32,Y-160,5,5);
   
   fill(155,22,139);
   ellipse(X-5,Y-167,40,40); 
   fill(255, 255, 255);
   ellipse(X-7, Y-167, 30, 30);
   fill(0);
   ellipse(X-17,Y-175,12,12);
   popMatrix(); 
   
   pushMatrix();
   translate(X+110, Y+13);
   noStroke();
   fill(155,22,139);
   ellipse(X-108,Y-140,40,40); 
   fill(255, 255, 255);
   ellipse(X-108, Y-140, 30, 30);
   fill(0);
   ellipse(X-105,Y-149,15,15);
  
   fill(155,22,139);
   ellipse(X-97,Y-167,37,37); 
   fill(255, 255, 255);
   ellipse(X-97, Y-167, 26, 26);
   fill(0);
   ellipse(X-100,Y-167,12,12);
   
   fill(155,22,139);
   ellipse(X-73,Y-175,27,27); 
   fill(255, 255, 255);
   ellipse(X-73, Y-175, 18, 18);
   fill(0);
   ellipse(X-77,Y-180,7,7);
   
   fill(155,22,139);
   ellipse(X-74,Y-148,37,37); 
   fill(255, 255, 255);
   ellipse(X-74, Y-148, 26, 26);
   fill(0);
   ellipse(X-88,Y-150,15,15);
  
   fill(155,22,139);
   ellipse(X-57,Y-125,32,32); 
   fill(255, 255, 255);
   ellipse(X-57, Y-125, 21, 21);
   fill(0);
   ellipse(X-50,Y-130,12,12);
  
  fill(155,22,139);
   ellipse(X-50,Y-178,40,40); 
   fill(255, 255, 255);
   ellipse(X-50, Y-178, 30, 30);
   fill(0);
   ellipse(X-58,Y-180,15,15);
  
    fill(155,22,139);
   ellipse(X-47,Y-148,30,30); 
   fill(255, 255, 255);
   ellipse(X-47, Y-148, 20, 20);
   fill(0);
   ellipse(X-50,Y-150,15,15);
  
    fill(155,22,139);
   ellipse(X-20,Y-133,30,30); 
   fill(255, 255, 255);
   ellipse(X-20, Y-133, 20, 20);
   fill(0);
   ellipse(X-22,Y-140,10,10);
  
   fill(155,22,139);
   ellipse(X-26,Y-150,15,15); 
   fill(255, 255, 255);
   ellipse(X-26, Y-150, 10, 10);
   fill(0);
   ellipse(X-22,Y-153,5,5);
   
   fill(155,22,139);
   ellipse(X-30,Y-162,15,15); 
   fill(255, 255, 255);
   ellipse(X-30, Y-162, 10, 10);
   fill(0);
   ellipse(X-32,Y-160,5,5);
   
   fill(155,22,139);
   ellipse(X,Y-156,40,40); 
   fill(255, 255, 255);
   ellipse(X, Y-156, 30, 30);
   fill(0);
   ellipse(X+2,Y-144,12,12);
   popMatrix();
   
for (int i=0; i<125 ;i=i+10) {
   fill(255,255,255);
   triangle(-60+i,-75,-65+i,-89,-55+i,-89);
} 
for (int i=0; i<60 ;i=i+10){
  triangle(-25+i,-23,-20+i,-8,-30+i,-8);
}

ellipse(43,-14,12,12);
triangle(35,-35, 30,-6, 43, -8);  //Canine
triangle(-35,-35,-30,-6,-43,-8);  //Canine
ellipse(-43,-14,12,12);

ellipse(70,-88,12,12);
ellipse(-69,-86,12,12);
}


// mouse detection

void mousePressed() {

  println("Clique: x "+(mouseX-200)+" y "+(mouseY-185));
}
