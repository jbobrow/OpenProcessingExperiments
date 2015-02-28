
//Setup canvas\\
size(400,400); //400x400
background(200); //set canvas colour


//Arms\\
rectMode(CENTER); //set rectangles to be drawn from center co-ord
rect(80,300,50,30);
rect(320,300,50,30);

//Body\\
ellipse(200,180,70,70); //head
ellipse(200,300,200,200); //body

//Eyes\\
fill(0); //setting colour (black)
ellipse(180,165,5,5); //left eye
fill(0);
ellipse(220,165,5,5); //right eye

//Smile\\
line (180,180,200,195);
line(220,180,200,195);

//Feet\\
fill(100); //Set feet colour
rect(220,390,20,20); // right foot
rect(180,390,20,20); //left foot

