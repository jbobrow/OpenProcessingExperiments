
/**
 * shuffle methods
 * by antiplastik <antiplastik@gmail.com>
 */

void shuffle(java.util.List l) {
  shuffle(l, System.currentTimeMillis());
}

void shuffle(java.util.List l, long seed) {
  Collections.shuffle(l, new Random(seed));
}

void shuffle(Object[] a) {
 shuffle(a, System.currentTimeMillis());
}

void shuffle(Object[] a, long seed) {
  Collections.shuffle(Arrays.asList(a), new Random(seed));
}

void shuffle(boolean[] a) {
  shuffle(a, System.currentTimeMillis());
}

void shuffle(boolean[] a, long seed) {
  Boolean[] objects = new Boolean[a.length];
  for (int i = 0; i < a.length; i++) {
    objects[i] = new Boolean(a[i]);
  }
  Collections.shuffle(Arrays.asList(objects), new Random((long) seed));
  for (int i = 0; i < a.length; i++) {
    a[i] = objects[i].booleanValue();
  }
}

void shuffle(byte[] a) {
  shuffle(a, System.currentTimeMillis());
}

void shuffle(byte[] a, long seed) {
  Byte[] objects = new Byte[a.length];
  for (int i = 0; i < a.length; i++) {
    objects[i] = new Byte(a[i]);
  }
  Collections.shuffle(Arrays.asList(objects), new Random((long) seed));
  for (int i = 0; i < a.length; i++) {
    a[i] = objects[i].byteValue();
  }
}

void shuffle(char[] a) {
  shuffle(a, System.currentTimeMillis());
}

void shuffle(char[] a, long seed) {
  Character[] objects = new Character[a.length];
  for (int i = 0; i < a.length; i++) {
    objects[i] = new Character(a[i]);
  }
  Collections.shuffle(Arrays.asList(objects), new Random((long) seed));
  for (int i = 0; i < a.length; i++) {
    a[i] = objects[i].charValue();
  }
}

void shuffle(double[] a) {
  shuffle(a, System.currentTimeMillis());
}

void shuffle(double[] a, long seed) {
  Double[] objects = new Double[a.length];
  for (int i = 0; i < a.length; i++) {
    objects[i] = new Double(a[i]);
  }
  Collections.shuffle(Arrays.asList(objects), new Random((long) seed));
  for (int i = 0; i < a.length; i++) {
    a[i] = objects[i].doubleValue();
  }
}

void shuffle(float[] a) {
  shuffle(a, System.currentTimeMillis());
}

void shuffle(float[] a, long seed) {
  Float[] objects = new Float[a.length];
  for (int i = 0; i < a.length; i++) {
    objects[i] = new Float(a[i]);
  }
  Collections.shuffle(Arrays.asList(objects), new Random((long) seed));
  for (int i = 0; i < a.length; i++) {
    a[i] = objects[i].floatValue();
  }
}

void shuffle(int[] a) {
  shuffle(a, System.currentTimeMillis());
}

void shuffle(int[] a, long seed) {
  Integer[] objects = new Integer[a.length];
  for (int i = 0; i < a.length; i++) {
    objects[i] = new Integer(a[i]);
  }
  Collections.shuffle(Arrays.asList(objects), new Random((long) seed));
  for (int i = 0; i < a.length; i++) {
    a[i] = objects[i].intValue();
  }
}

void shuffle(long[] a) {
  shuffle(a, System.currentTimeMillis());
}

void shuffle(long[] a, long seed) {
  Long[] objects = new Long[a.length];
  for (int i = 0; i < a.length; i++) {
    objects[i] = new Long(a[i]);
  }
  Collections.shuffle(Arrays.asList(objects), new Random((long) seed));
  for (int i = 0; i < a.length; i++) {
    a[i] = objects[i].longValue();
  }
}


