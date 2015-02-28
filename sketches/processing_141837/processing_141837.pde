

int a;
int b;
background(255,255,255);
size(800,800); // width=300 height=300

a=width/2;
b=height/2;


//oreja izquierda
strokeWeight(5);
stroke(19,21,12);
fill(135,185,34);
ellipse(a-width/8,b-(height/4.5),width/11,height/10);

//oreja derecha
stroke(19,21,12);
fill(135,185,34);
ellipse(a+width/15,b-(height/4),width/11,height/10);

//cuerpo
stroke(19,21,12);
strokeWeight(5);
fill(135,185,34);
ellipseMode(CENTER);
ellipse(a,b,a,(2*height)/4.5);

//oreja izquierda
noStroke();
ellipse(a-width/8,b-(height/4.5),width/11,height/10);
fill(56,149,43);
ellipse(a-width/8,b-(height/4.5),width/22,height/25);

//oreja derecha
noStroke();
fill(135,185,34);
ellipse(a+width/15,b-(height/4),width/11,height/10);
fill(56,149,43);
ellipse(a+width/15,b-(height/4),width/25,height/22);

//boca
noStroke();
fill(30,59,29);
ellipse(a,b+height/25,(2*width)/10,b/2);

//ceja izquierda
noStroke();
fill(32,91,39);
ellipse(a-(width*3)/16,b-height/20,(width*3)/30,(height*3)/30);
fill(135,185,34);
ellipse(a-(width*3)/16,b-height/25,(width*3)/28,(height*3)/28);

//ceja derecha
noStroke();
fill(32,91,39);
ellipse(a+(width*3)/16,b-height/20,(width*3)/30,(height*3)/30);
fill(135,185,34);
ellipse(a+(width*3)/16,b-height/23,(width*3)/28,(height*3)/28);

//ojo izquierda
strokeWeight(3);
stroke(65,112,43);
fill(255,255,255);
ellipse(a-(width*3)/16,b,(width*3)/30,(height*3)/30);
ellipse(a+(width*3)/16,b,(width*3)/30,(height*3)/30);

//ojo derecha
noStroke();
fill(0,0,0);
ellipse(a-(width*3)/15,b,(width*2)/75,(height*2)/75);
ellipse(a+(width*3)/16.5,b,(width*2)/75,(height*2)/75);

//diente medio
fill(68,114,38);
ellipse(a,b+(height/9),width/20,height/15);
fill(255,255,255);
ellipse(a,b+(height/9),width/25,(height*4)/75);

//diente izquierda
fill(68,114,38);
ellipse(a-width/20,b+(height/10),width/20,height/15);
fill(255,255,255);
ellipse(a-width/20,b+(height/10),width/25,(height*4)/75);

//diente derecha
fill(68,114,38);
ellipse(a+width/20,b+(height/10.5),width/20,height/15);
fill(255,255,255);
ellipse(a+width/20,b+(height/10.5),width/25,(height*4)/75);

//nariz
stroke(87,134,39);
strokeWeight(5);
fill(179,201,2);
ellipse(a,b,a/2,(2*height)/10);

//agujero nariz izquierda
noStroke();
fill(30,59,29);
ellipse(a-width/20,b,width/25,width/15);

//agujero nariz derecha
noStroke();
fill(30,59,29);
ellipse(a+width/20,b,width/25,width/20);








