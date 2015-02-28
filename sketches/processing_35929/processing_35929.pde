
size(500, 500); //defines board size

background(255, 0, 0); //colors the background RED !

noStroke();  // eleiminates stroke for clothing
fill(16, 62, 2); // green colored shirt
rect(125, 400, 250, 100); //creates rectangle for body

fill(255, 255, 255);   //whitens sleeve
triangle(125, 400,  75, 500,  125, 500); //left sleeve
triangle(375, 400,  425, 500,  375, 500);//right sleeve

fill(237, 153, 17); //matches yellow orange tie to hair
triangle(225, 400,  275, 400,  250, 450);  //top of tie
triangle(250, 450,  220, 500,  280, 500);  //bottom of tie

smooth();  //makes stroke smooth

stroke(1); //returns stroke to size 1
stroke(165, 110, 28); //light face border
fill(255, 236, 206);  // skin color fill
ellipse(100, 250, 40, 100);//left ear
ellipse(400, 250, 40, 100);//right ear
ellipse(250, 250, 300, 300); //circular head

stroke(0, 0, 0); //black glasses
strokeWeight(5); //thick line for glasses
strokeCap(SQUARE); //square end to top of glasses frame
line(100, 197, 400, 197); //glasses
rect(150, 200, 50, 50); // left square lens
rect(300, 200, 50, 50); //right square lens

strokeWeight(2); // 2 thickening strokeweight
stroke(165, 110, 28); // light brown stroke color
ellipse(175, 225, 50, 50); //left eyelid

stroke(0, 0, 0); //black border
fill( 0, 0, 0); //black pupil
ellipse(175, 225, 50, 10); //left eye

stroke(165, 110, 28); // light brown stroke color
fill(255, 236, 206);  // beige fill
ellipse(325, 225, 50, 50); //right eyelid

stroke(0, 0, 0); //black border
fill( 0, 0, 0);  //black pupil
ellipse(325, 225, 50, 10); //right eye

ellipse(250, 350, 100, 50); //mouth

noStroke();  //eliminates stroke in hair
fill(237, 153, 17);  // yellow-orange hair
triangle(150, 100,  400, 200,  325, 100);  //right section of hair
triangle(150, 100,  100, 200,  200, 100);  //left section of hair
triangle(150, 100, 225, 175, 250, 100);    //middle section of hair

fill(54, 36, 5);  //brown hat
arc(236, 100, 177.5, 100, PI, TWO_PI);  //half circle for upper hat
ellipse(240, 100, 300, 50);  //ellispe for brim       
