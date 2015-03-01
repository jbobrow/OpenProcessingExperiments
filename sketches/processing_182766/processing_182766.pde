
//bike w a background -Bára Bjarnadóttir

     void setup (){
size (1400, 800);
background (200,150,100);

stroke (200,205,255);
strokeWeight (4);
ellipse (400,400, 150,150);


ellipse (700,400, 150,150);

line (500,400,500,300);

line (400,400,500,300);

line (500,300,700,400);

//lína upp frá hægra hjóli
line (700,400,650,250);

//lína sem tengir neðri stöng á vinstri hjóli
line(400,400,500,400);

//lína frá miðju upp í stýri
line(500,400,650,250);

//stýri hægra megin
line(650,250, 750, 220);
line(750,220, 725, 210);

//stýri vinstra megin
line(650,250, 550, 280);
line(550,280, 525, 270);

//hnakkur
fill(150,200,280);
triangle(500,300, 475, 290, 550, 285);

//pedalar vinstri
line (500,400,485, 425);
noFill ();
rect (475,425, 28,10);

//pedalar hægri
line (500,400, 515, 375);
rect(505,365,28,10);

     }
     
     void draw (){
       if (mousePressed) {
         line (mouseX, mouseY, 400,400);
         strokeWeight (1);
         stroke(250,150,255);
         background (210,120,120);

stroke (200,205,255);
strokeWeight (4);
ellipse (400,400, 150,150);


ellipse (700,400, 150,150);

line (500,400,500,300);

line (400,400,500,300);

line (500,300,700,400);

//lína upp frá hægra hjóli
line (700,400,650,250);

//lína sem tengir neðri stöng á vinstri hjóli
line(400,400,500,400);

//lína frá miðju upp í stýri
line(500,400,650,250);

//stýri hægra megin
line(650,250, 750, 220);
line(750,220, 725, 210);

//stýri vinstra megin
line(650,250, 550, 280);
line(550,280, 525, 270);

//hnakkur
fill(150,200,280);
triangle(500,300, 475, 290, 550, 285);

//pedalar vinstri
line (500,400,485, 425);
noFill ();
rect (475,425, 28,10);

//pedalar hægri
line (500,400, 515, 375);
rect(505,365,28,10);
       if (mousePressed) {
         line (mouseX, mouseY, 400,400);
         strokeWeight (1);
         stroke(250,150,255);
       }
       }
     }


