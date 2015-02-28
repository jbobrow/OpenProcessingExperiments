
println("Homer Simpson ama las rosquillas");
size(580,380);//width és 290 i height és 190)

background(255);

//Orejas Homer

stroke(255);
fill(255,217,15);
ellipse(width*0.275,height*0.578,width*0.051,height*0.078);
ellipse(width*0.572,height*0.578,width*0.051,height*0.078);

//Cara Homer 

stroke(255);
fill(255,217,15);
rectMode(CENTER);
fill(255,217,15);
rect(width*0.420,height*0.473,width*0.268,height*0.473);



//Pelitos +Calva

fill(0);
arc(width*0.420,height*0.131,width*0.103,height*0.157,3.13,TWO_PI,OPEN);
fill(255);
arc(width*0.420,height*0.131,width*0.1,height*0.15,3.13,TWO_PI,OPEN);
stroke(255);
fill(255,217,15);
arc(width*0.420,height*0.268,width*0.268,height*0.315,3.13,TWO_PI,OPEN);

//Barba Homer

stroke(0);
fill(209,178,112);
ellipseMode(CENTER);
ellipse(width*0.420,height*0.710,width*0.268,height*0.263);

//Nariz Homer

noFill();
arc(width*0.420,height*0.526,width*0.044,height*0.068, 0, PI, OPEN);

//Ojos Homer

fill(255);
ellipseMode(CENTER);
ellipse(width*0.344,height*0.421,width*0.137,height*0.21);
fill(255);
ellipseMode(CENTER);
ellipse(width*0.5,height*0.421,width*0.137,height*0.21);

//Pupilas Homer

fill(0);
ellipse(width*0.31,height*0.421,width*0.034,height*0.052);
fill(0);
ellipse(width*0.465,height*0.421,width*0.034,height*0.052);

//Rosquilla

stroke(255);
fill(245,106,106);
ellipse(width*0.103,height*0.421,width*0.155,height*0.236);
fill(255);
ellipse(width*0.103,height*0.421,width*0.044,height*0.068);

//Boca Homer

stroke(0);
fill(0);
ellipse(width*0.344,height*0.684,width*0.034,height*0.052);



println(mouseX+"  "+mouseY);


