
size(400, 400);
background (255);
/*textSize (32);
text("Klõpsi hiirt ja klaviatuuri", 20, 20);
*/

void mousePressed () {

strokeWeight (6);
line(mouseX+800, mouseY-20, mouseX-800, mouseY-20);
line(mouseX+800, mouseY+20, mouseX-800, mouseY+20);
line(mouseX-25, mouseY+800, mouseX-25, mouseY-800);
line(mouseX+25, mouseY+800, mouseX+25, mouseY-800);

fill (random(255),random(255),random(255));
strokeWeight(0);
rectMode (CENTER);
rect(mouseX, mouseY, 50,40);
}

void keyPressed () {
    background (255);
}

/*strokeWeight(10);
line (mouseX-20, MouseY+20, 400, 40);
line (0, 80, 400, 80);
line (60, 0, 60, 400);
line (120, 0, 120, 400);


fill(0, 255, 0);
rect(60, 40, 60, 40);
}
*/
