
void setup()
{
  size(300, 300);
}

void draw()
{
  fill(random(0, 255));
  rect(random(10, 100), random(10, 100), 
	random(width - 100, width - 10), random(height - 100, height - 10));
}

void keyPressed()
{
  noLoop();
  /*
  javax.swing.JOptionPane.showMessageDialog(this, 
	"You are using Processing\nThanks for your attention", 
	"Informational message", 
	javax.swing.JOptionPane.INFORMATION_MESSAGE);
   String preset="1";
   */
   String tempString=javax.swing.JOptionPane.showInputDialog(frame,"Finished!   Enter your name:","");
   int value=int(tempString);

  loop();
}

/*
SwingUtilities.invokeLater(new Runnable() {  
 public void run()
 {  
   String preset="1";
   String tempString=javax.swing.JOptionPane.showInputDialog(frame,"Type your input here",preset);
   int value=int(tempString);
 }  
}*/

