
public static class LightData {
  public float dx, dy;
  public byte index;
  
  public LightData(float dx, float dy, int index)
  {
    this.dx = dx;
    this.dy = dy;
    if(index > 127) {
      println("Index is too large");
    }
    this.index = (byte) index;
  }
  
  public String toString()
  {
    return "dx: " + dx + ", dy: " + dy + ", index: " + index;
  }
}
