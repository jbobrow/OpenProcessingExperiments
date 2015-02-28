
class Add extends SpectrumCtrller
{
  Ctrller slot1, slot2;
  Add( Ctrller slot1in, Ctrller slot2in )
  {
    super();
    slot1 = slot1in;
    slot2 = slot2in;
  }
  Add( Ctrller slot1in, float slot2in )
  {
    super();
    slot1 = slot1in;
    slot2 = new SpectrumCtrller(slot2in);
  }
  
  void step()
  {
    slot1.step();
    slot2.step();
    value = slot1.gvf() + slot2.gvf();
  }
}

class Avg extends SpectrumCtrller
{
  Ctrller slot1, slot2;
  Avg( Ctrller slot1in, Ctrller slot2in )
  {
    super();
    slot1 = slot1in;
    slot2 = slot2in;
  }
  
  void step()
  {
    slot1.step();
    slot2.step();
    value = (slot1.gvf() + slot2.gvf()) / 2;
  }
}

class Amp extends SpectrumCtrller
{
  Ctrller slot1, slot2;
  Amp( Ctrller slot1in, Ctrller slot2in )
  {
    super();
    slot1 = slot1in;
    slot2 = slot2in;
  }
  Amp( Ctrller slot1in, float slot2in )
  {
    super();
    slot1 = slot1in;
    slot2 = new SpectrumCtrller(slot2in);
  }
  
  void step()
  {
    slot1.step();
    slot2.step();
    value = slot1.gvf() * slot2.gvf();
  }
}

class Inverter extends SpectrumCtrller
{
  Ctrller slot1;
  Inverter( Ctrller slot1in )
  {
    super();
    slot1 = slot1in;
  }
  
  void step()
  {
    slot1.step();
    value = 1 - slot1.gvf();
  }
}

class SpectrumToSwitch extends SwitchCtrller
{
  Ctrller slot1;
  SpectrumToSwitch( Ctrller slot1in )
  {
    super();
    slot1 = slot1in;
  }
  
  void step()
  {
    slot1.step();
    value = false;
    if(slot1.gvf() >= .5)
      value = true;
  }
}

