
size(400,400); background(204,161,33);
//blue solids
noStroke();fill(24,56,150);rect(width/4,height/3,width/3,height);
triangle(width,height/height,width-(width/3),height/height,width,height/3);
stroke(24,56,150);strokeWeight(5);
line(width/2,height-(height/4),width,height-(height/4));
line(width/2,height-(height/4)+10,width,height-(height/4)+10);
line(width/2,height-(height/4)+20,width,height-(height/4)+20);
//yellow lines
stroke(204,161,33);
line(width-((width/4)*3),height-(height/4),width/2,height-(height/4));
line(width-((width/4)*3),height-(height/4)+10,width/2,height-(height/4)+10);
line(width-((width/4)*3),height-(height/4)+20,width/2,height-(height/4)+20);
