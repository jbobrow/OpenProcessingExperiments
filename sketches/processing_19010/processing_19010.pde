
size(600, 600);
background (#2bbfcc);

                                                                                                                                                                                                                                         
noStroke();
smooth();
quad(105, 0, 120, 10, 120, 600, 80, 600);
quad(400, 0, 375, 150, 120, 600, 80, 600);
quad(400, 0, 375, 150, 120, 600, 80, 600);
quad(200, 0, 255, 150, 120, 300, 550, 600);


// Draw random lines
stroke(#16585e);
strokeWeight(2);
line(300, 300, 420, 300);
line(120, 300, 420, 420);
line(420, 150, 150, 420);
line(520, 150, 150, 520);

ellipse(410,320,80,80);

stroke(#f3cb30);
strokeWeight(20);
point(420,420); //less transparency
point(420,300);
strokeWeight(22);
point(150,520);
strokeWeight(15);
point(150,420);
point(120,300);
point(420,150);
strokeWeight(11);
point(520,150);
strokeWeight(22);
point(70,120);
point(180,200);

ellipse(410,320,80,80);

strokeWeight(12);
stroke(242,204,47,204); //More transparency
stroke(262,160,57,105); //no transparency
line(120, 120, 300, 420);
line(300, 420, 300, 300);
ellipse(100,90,70,70); //yellow
ellipse(300,300,140,140);//blue

smooth();
noFill();
beginShape();
vertex(410,280);
bezierVertex(5,0,80,0,50,55); 
vertex(70,120);
vertex(35,225);
bezierVertex(180,260,175,90,180,200);
endShape();









