

int xPos = 50;
int yPos = 50;
int d = 200;
int direction = 1;
    


PFont font; 
String txt ="Praesent sit amet dui nec nisl euismod dapibus. Etiam et nisl vel odio posuere porta quis at quam. Nulla sit amet diam nisl, eu consequat magna. Morbi sit amet nibh nunc, ut vehicula sem. Aenean fringilla volutpat urna, eu posuere elit accumsan a. Maecenas facilisis ornare iaculis. Curabitur vehicula, quam vel auctor adipiscing, elit lorem dignissim ligula, vitae pulvinar enim tellus quis odio. Suspendisse potenti. Vivamus quis dictum velit. Praesent eu aliquet enim. Aliquam nec rhoncus sem. Cras accumsan mattis metus dignissim tempor. Fusce sit amet ligula felis, id semper dolor. Duis tempus odio ut nulla egestas sagittis.Praesent sit amet dui nec nisl euismod dapibus. Etiam et nisl vel odio posuere porta quis at quam. Nulla sit amet diam nisl, eu consequat magna. Morbi sit amet nibh nunc, ut vehicula sem. Aenean fringilla volutpat urna, eu posuere elit accumsan a. Maecenas facilisis ornare iaculis. Curabitur vehicula, quam vel auctor adipiscing, elit lorem dignissim ligula, vitae pulvinar enim tellus quis odio. Suspendisse potenti. Vivamus quis dictum velit. Praesent eu aliquet enim. Aliquam nec rhoncus sem. Cras accumsan mattis metus dignissim tempor. Fusce sit amet ligula felis, id semper dolor. Duis tempus odio ut nulla egestas sagittis.Praesent sit amet dui nec nisl euismod dapibus. Etiam et nisl vel odio posuere porta quis at quam. Nulla sit amet diam nisl, eu consequat magna. Morbi sit amet nibh nunc, ut vehicula sem. Aenean fringilla volutpat urna, eu posuere elit accumsan a. Maecenas facilisis ornare iaculis. Curabitur vehicula, quam vel auctor adipiscing, elit lorem dignissim ligula, vitae pulvinar enim tellus quis odio. Suspendisse potenti. Vivamus quis dictum velit. Praesent eu aliquet enim. Aliquam nec rhoncus sem. Cras accumsan mattis metus dignissim tempor. Fusce sit amet ligula felis, id semper dolor. Duis tempus odio ut nulla egestas sagittis.Praesent sit amet dui nec nisl euismod dapibus. Etiam et nisl vel odio posuere porta quis at quam. Nulla sit amet diam nisl, eu consequat magna. Morbi sit amet nibh nunc, ut vehicula sem. Aenean fringilla volutpat urna, eu posuere elit accumsan a. Maecenas facilisis ornare iaculis. Curabitur vehicula, quam vel auctor adipiscing, elit lorem dignissim ligula, vitae pulvinar enim tellus quis odio. Suspendisse potenti. Vivamus quis dictum velit. Praesent eu aliquet enim. Aliquam nec rhoncus sem. Cras accumsan mattis metus dignissim tempor. Fusce sit amet ligula felis, id semper dolor. Duis tempus odio ut nulla egestas sagittis. ";


void setup () {
size (400, 600, P2D);

font = loadFont ("Archer-Book-30.vlw");
textFont (font);

}

void draw () {
background (255);



/*textSize (40);
fill (200);
text ("this is a headline ", mouseX, 40);*/


textSize (20); 

fill (0);
//textLeading ();
text (txt, mouseX, 30, mouseX, mouseY);

 if (xPos < 20) {
  direction = - direction;
 xPos =  xPos + direction;
 } else if (xPos > width - d) {
 direction = - direction;
  xPos =  xPos + direction;
 } else {
  xPos =  xPos + direction;}



text (txt, xPos, yPos, 400, height); 


}

