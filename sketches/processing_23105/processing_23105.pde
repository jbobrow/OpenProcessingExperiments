

//The client for the TeleParrot project.
//The client should run on the computer of
//the person controlling the parrot.

void setup()
{
  // UI setup
  size(w, h);
  frameRate(fps);
  user_interface_setup();

  // Connection Setup  
  //parrot_controller = new Client(this, "127.0.0.1", 12345);
}

void draw()
{
  // UI Draw
  user_interface_draw();

  // Data Transfer
  //parrot_controller.write(data);
}

void mouseClicked()
{
  // Connect Button
  if (mouseButton == LEFT)
  {
    if(mouseX > 250 && mouseX < 350 && mouseY > 250 && mouseY < 350)
    {
      parrot_controller = new Client(this, "127.0.0.1", 12345);
      parrot_controller.write("Samurai Pizza Parrot");
    }
  }
}


