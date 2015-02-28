
// Hue values (phi) are in radians.
// Saturation (sat) is in the range (-1, +1); 0 saturation generates 
// a grey value, +1 saturation a bright colour and -1 a bright but
// inverted colour.
// Lightness (lux) is also in the range (-1, +1); -1 yields black,
// +1 yields white, and values near 0 yield mid-tones.
// Note that inverting the saturation is the same as rotating the 
// hue by 180deg.

// Given a hue value, generate the corresponding RGB vector.
float[] chroma(float phi) {
  
  // Ensure phi is in the range (0, TWO_PI)
  phi = phi % TWO_PI;
  if (phi < 0)
    phi += TWO_PI;

  // Calculate fractional components
  float p = (phi / THIRD_PI) % 1;
  float q = 1 - p;
  
  // Select RGB array
  switch (int(phi / THIRD_PI)) {
  case 0: return new float[] {1, p, 0};
  case 1: return new float[] {q, 1, 0};
  case 2: return new float[] {0, 1, p};
  case 3: return new float[] {0, q, 1};
  case 4: return new float[] {p, 0, 1};
  case 5: return new float[] {1, 0, q};
  default: return null;
  }
}

// Modify the value k according to the given properties.
// luma(k, sat) = luma(k, sat, 0)
float luma(float k, float sat) {
  return (1 - sat) / 2 + sat * k;
}
float luma(float k, float sat, float lux) {
  return (lux < 0) ? (1 + lux) * luma(k, sat) : lux + (1 - lux) * luma(k, sat);
}

// Assumes colorMode(RGB, 1)
color genColor(float phi, float sat, float lux) {
  float[] rgb = chroma(phi);
  return color(luma(rgb[0], sat, lux), luma(rgb[1], sat, lux), luma(rgb[2], sat, lux));
}

// genColor(phi) = genColor(phi, 1, 0)
// Assumes colorMode(RGB, 1)
color genColor(float phi) {
  float[] rgb = chroma(phi);
  return color(rgb[0], rgb[1], rgb[2]);
}

