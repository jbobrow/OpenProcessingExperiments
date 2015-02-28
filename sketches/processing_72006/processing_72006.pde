
void blur(float[] from, float[] to, float[] buffer, int w, int h, int radius) {
  // build integral image
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i = y * w + x;
      if (y == 0 && x == 0) {
        buffer[i] = from[i];
      } else if (y == 0) {
        buffer[i] = buffer[i - 1] + from[i];
      } else if (x == 0) {
        buffer[i] = buffer[i - w] + from[i];
      } else {
        buffer[i] = buffer[i - 1] + buffer[i - w] - buffer[i - w - 1] + from[i];
      }
    }
  }
  // do lookups
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int minx = max(0, x - radius);
      int maxx = min(x + radius, w - 1);
      int miny = max(0, y - radius);
      int maxy = min(y + radius, h - 1);
      int area = (maxx - minx) * (maxy - miny);
      
      int nw = miny * w + minx;
      int ne = miny * w + maxx;
      int sw = maxy * w + minx;
      int se = maxy * w + maxx;
      
      int i = y * w + x;
      to[i] = (buffer[se] - buffer[sw] - buffer[ne] + buffer[nw]) / area;
    }
  }
}


