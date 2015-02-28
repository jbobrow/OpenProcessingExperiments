
public class BinFileReader{
  private byte[] b;
  int pos = 0; 

  BinFileReader( String filename){
    b = loadBytes(filename); 
  }

  int readIntBig(int nBytes){
    byte[] buf =  new byte[nBytes];
    for (int i = 0; i < nBytes; i++)
      buf[nBytes-(i+1)] = b[pos++];
      //println("pos " + pos);
    return convertToInt(buf);
  }

  int readIntLittle(int nBytes){
    byte[] buf =  new byte[nBytes];
    for (int i = 0; i < nBytes; i++)
      buf[i] = b[pos++];
      //println("pos " + pos);
    return convertToInt(buf);
  }

  double readDoubleBig(int nBytes){
    byte[] buf =  new byte[nBytes];
    for (int i = 0; i < nBytes; i++)
      buf[nBytes-(i+1)] = b[pos++];
      //println("pos " + pos);
    return Double.longBitsToDouble (convertToLong(buf));
  }

  double readDoubleLittle(int nBytes){
    byte[] buf =  new byte[nBytes];
    for (int i = 0; i < nBytes; i++)
      buf[i] = b[pos++];
      //println("pos " + pos);
    return Double.longBitsToDouble( convertToLong(buf));
  }

  int convertToInt(byte[] buf) {
    return (((buf[3] & 0xff) << 24) |
      ((buf[2] & 0xff) << 16) |
      ((buf[1] & 0xff) << 8) |
      (buf[0] & 0xff));
  }

  long convertToLong(byte[] buf) {
    return (((long) (buf[7] & 0xff) << 56) |
      ((long) (buf[6] & 0xff) << 48) |
      ((long) (buf[5] & 0xff) << 40) |
      ((long) (buf[4] & 0xff) << 32) |
      ((long) (buf[3] & 0xff) << 24) |
      ((long) (buf[2] & 0xff) << 16) |
      ((long) (buf[1] & 0xff) <<  8) |
      ((long) (buf[0] & 0xff)));
  }
}







