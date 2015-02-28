
String b = "\" Hopeful Haiku -an exersize in Irony";
String q = "\" Call to ruin, B \n Late and short on the dime \n Just give up, you're screwed \"";

String c = "\"Processing Limerick -an exersize in esoteric humor \"";
String d = "\"Abscration turned to instantiation and the polymorpic vaules ran the FSM in one fail swoop \n The class hierarchy was readable and interated by the while loop \n The vehicles had solid collision \n Codes at it's final revision \n Convert to JavaScript and it all turns to poop \"";

String e = "\" My life is a lie, Quatrain -an exersize in self loathing\"";
String f = "\" Sorrow is my loyal girlfriend \n Sorrow wants to just be friends.. \n I cheat when I play my grandma in Monopoly \n Black is the only color that understands me...\"";
void setup() {  
size(800, 800);
}
 
void draw() {
background(mouseX);
fill(4*mouseY);
 
textAlign(CENTER);

textSize(20);
text(b, width/2, 100);

textSize(15);
text(q, width/2, 150);

fill(2*mouseY);

textSize(20);
text(c, width/2, 300);

textSize(15);
text(d, width/2, 350);

fill(mouseY);

textSize(20);
text(e, width/2, 500);

textSize(15);
text(f, width/2, 550);

 
}



