
public class ColorFunction
{
  // 1: Minimum, 2: Maximum, 3: rotMulipiler, 4: rotAdder
  
  float[] rData = new float[4];
  float[] gData = new float[4];
  float[] bData = new float[4]; 
  
  public ColorFunction(float[] _rData, float[] _gData, float[] _bData)
  {
    rData = _rData;
    gData = _gData;
    bData = _bData;
  }
  
  public float getR(float rot)
  {
    return (rData[0] + rData[1]*0.5f*(sin(rot*rData[2] + rData[3])+1));
  }
  
  public float getB(float rot)
  {
    return (bData[0] + bData[1]*0.5f*(sin(rot*bData[2] + bData[3])+1));
  }
  
  public float getG(float rot)
  {
    return (gData[0] + gData[1]*0.5f*(sin(rot*gData[2] + gData[3])+1));
  }
  
  public void SetStroke(float rot)
  {
    stroke(getR(rot), getG(rot), getB(rot));
  }
  
  public float[] GetColor(float rot)
  {
    return new float[]{getR(rot), getG(rot), getB(rot)};
  }
}

