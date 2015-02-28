
class Bulb {
  Bulb input1;
  Bulb input2;
  int rule;
  boolean state;

  public Bulb() {
    input1 = null;
    input2 = null;
    rule = 0;
    state = false;
  }

  /*
   * A bulb's next state is determined by one of four
   * rules, assigned at random:
   * 0: the bulb is on if both its inputs are on
   * 1: the bulb is off if both its inputs are on
   * 2: the bulb is on if at least one of the inputs is on
   * 3: the bulb is off if at least one of the inputs is on
   * 4: the bulb is on if both its inputs are the same
   * 5: the bulb is off if both its inputs are the same
   *
   * This program uses only the first four rules. If you
   * set MAX_RULE to 6, the cycling is not quick nor apparent.
   */
  public boolean getNextState()
  {
    boolean result = false;
    switch (rule) {
    case 0:
      result = input1.state && input2.state;
      break;
    case 1:
      result = !(input1.state || input2.state);
      break;
    case 2:
      result = input1.state || input2.state;
      break;
    case 3:
      result = !(input1.state && input2.state);
      break;
    case 4:
      result = (input1.state == input2.state);
      break;
    case 5:
      result = (input1.state != input2.state);
      break;
    }
    return result;
  }
}


