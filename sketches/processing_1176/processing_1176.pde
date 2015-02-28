
class Average{
  float[] avg;
  float tot = 0;
  Average() {}
  void add(float[] data) {
    if(tot == 0)
      avg = clonef(data);
    else
      for(int i = 0; i<data.length; i++)
        avg[i] = ((avg[i] * tot) + data[i]) / (tot + 1);
    tot++;
  }
}

