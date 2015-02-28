
ADSwitch switch1;
ADSwitch switch2;
ADSwitch switch3;
ADSwitch switch4;

void setup()
{
  size(400,130);
  smooth();
  
  switch1 = new ADSwitch(63, 65, "S1");
  switch2 = new ADSwitch(155, 65, "S2");
  switch2.setOn();
  switch3 = new ADSwitch(247, 65, "S3");
  switch4 = new ADSwitch(340, 65, "S4");
  switch4.setOn();

}

void draw()
{
  background(255);
  switch1.update();
  switch2.update();
  switch3.update();
  switch4.update();  
}


