
float a;
float b;
float c;
float d;
float e;
float f;
float g;
float h;
float i;
float j;
float k;
float l;
float m;
float n;
float o;
float p;
float q;
float r;
float s;
float t;
float u;
float v;
float w;

float debuta;
float debutb;
float debutc;
float debutd;
float debute;
float debutf;
float debutg;
float debuth;
float debuti;
float debutj;
float debutk;
float debutl;
float debutm;
float debutn;
float debuto;
float debutp;
float debutq;
float debutr;
float debuts;
float debutt;
float debutu;
float debutv;
float debutw;

float deplacementh;

float deplacementha;
float deplacementhb;
float deplacementhc;
float deplacementhd;
float deplacementhe;
float deplacementhf;
float deplacementhg;
float deplacementhh;
float deplacementhi;
float deplacementhj;
float deplacementhk;
float deplacementhl;
float deplacementhm;
float deplacementhn;
float deplacementho;
float deplacementhp;
float deplacementhq;
float deplacementhr;
float deplacemenths;
float deplacementht;
float deplacementhu;
float deplacementhv;
float deplacementhw;

float declencheur;
float vitessedeclencheur;

float vitesseh;
float vitessehaleatoire;
float reductionvitesseha;
float deplacementvertical;

float deplacementhorizontal;
float deplacementegal;
float placementaleatoire;
int espacement;

void setup () {
  size (500,500);
  smooth ();
  
  
  
  
  
  
  
  
  
  
  //   PREMIERS PARAMETRES
  
  
  
  
  
  
  
  
  
  
  //   D'AUTRES PARAMETRES SONT MODIFIABLES PLUS BAS
  
  
  
  
  
  //   espacement entre les lignes
  espacement = 5;
  
  //   déplacement aléatoire?  1 - oui / 0 - non
  deplacementhorizontal = 1;
  
  //   toutes les lignes se déplacent de la même façon?  1 - oui / 0 - non
  deplacementegal = 1;
  
  //   placement de départ aléatoire?  1 - oui / 0 - non
  placementaleatoire = 0;
  
  //   couleur du fond
  background (215,205,195);
  //background (50,75,100);
  //background (0);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  a = 0;
  b = 0;
  c = 0;
  d = 0;
  e = 0;
  f = 0;
  g = 0;
  h = 0;
  i = 0;
  j = 0;
  k = 0;
  l = 0;
  m = 0;
  n = 0;
  o = 0;
  p = 0;
  q = 0;
  r = 0;
  s = 0;
  t = 0;
  u = 0;
  v = 0;
  w = 0;
  
  deplacementha = 0;
  deplacementhb = 0;
  deplacementhc = 0;
  deplacementhd = 0;
  deplacementhe = 0;
  deplacementhf = 0;
  deplacementhg = 0;
  deplacementhh = 0;
  deplacementhi = 0;
  deplacementhj = 0;
  deplacementhk = 0;
  deplacementhl = 0;
  deplacementhm = 0;
  deplacementhn = 0;
  deplacementho = 0;
  deplacementhp = 0;
  deplacementhq = 0;
  deplacementhr = 0;
  deplacemenths = 0;
  deplacementht = 0;
  deplacementhu = 0;
  deplacementhv = 0;
  deplacementhw = 0;
  
  if (placementaleatoire > 0){
    deplacementha = random (0,width);
    deplacementhb = random (0,width);
    deplacementhc = random (0,width);
    deplacementhd = random (0,width);
    deplacementhe = random (0,width);
    deplacementhf = random (0,width);
    deplacementhg = random (0,width);
    deplacementhh = random (0,width);
    deplacementhi = random (0,width);
    deplacementhj = random (0,width);
    deplacementhk = random (0,width);
    deplacementhl = random (0,width);
    deplacementhm = random (0,width);
    deplacementhn = random (0,width);
    deplacementho = random (0,width);
    deplacementhp = random (0,width);
    deplacementhq = random (0,width);
    deplacementhr = random (0,width);
    deplacemenths = random (0,width);
    deplacementht = random (0,width);
    deplacementhu = random (0,width);
    deplacementhv = random (0,width);
    deplacementhw = random (0,width);
  }
  
  debuta = 1*espacement;
  debutb = 2*espacement;
  debutc = 3*espacement;
  debutd = 4*espacement;
  debute = 5*espacement;
  debutf = 6*espacement;
  debutg = 7*espacement;
  debuth = 8*espacement;
  debuti = 9*espacement;
  debutj = 10*espacement;
  debutk = 11*espacement;
  debutl = 12*espacement;
  debutm = 13*espacement;
  debutn = 14*espacement;
  debuto = 15*espacement;
  debutp = 16*espacement;
  debutq = 17*espacement;
  debutr = 18*espacement;
  debuts = 19*espacement;
  debutt = 20*espacement;
  debutu = 21*espacement;
  debutv = 22*espacement;
  debutw = 23*espacement;
  
  a = a+debuta;
  b = b+debutb;
  c = c+debutc;
  d = d+debutd;
  e = e+debute;
  f = f+debutf;
  g = g+debutg;
  h = h+debuth;
  i = i+debuti;
  j = j+debutj;
  k = k+debutk;
  l = l+debutl;
  m = m+debutm;
  n = n+debutn;
  o = o+debuto;
  p = p+debutp;
  q = q+debutq;
  r = r+debutr;
  s = s+debuts;
  t = t+debutt;
  u = u+debutu;
  v = v+debutv;
  w = w+debutw;
  
  deplacementh = 0;
  
  declencheur = 0;
  
}

void draw () {
  
  
  
  
  
  
  
  
  
  
                                  //   PARAMETRES
  
  
  
  
  
  
  
  
  
  
  //   D'AUTRES PARAMETRES SONT MODIFIABLES PLUS HAUT
  
  
  
  
  
  //   taille ellispes
  int taillee;
  taillee = 1;
  
  
  //   vitesse défilement horizontal fixe
  vitesseh = 1;
  
  //   vitesse défilement horizontal aléatoire
  vitessehaleatoire = 2;
  
  //   réduction vitesse 
  reductionvitesseha = 1;
  
  //   vitesse déplacemen1t vertical
  deplacementvertical = 1;
  
  //   vitesse du déclencheur
  vitessedeclencheur = 1;
  
  
  //   couleur des lignes
  color couleurlignes = color (45,35,25,random(0,25));
  //color couleurlignes = color (random (200,255),random (0,80),random (0,80),random (0,75));
  
  
  //   placement vertical régulier?  1 - oui / 0 - non
  int placementverticalr;
  placementverticalr = 0;
  
  //   placement vertical de début régulier?  1 - oui / 0 - non
  int placementdebutr;
  placementdebutr = 0;
  
  //   retour en haut du format?  1 - oui / 0 - non
  int retourenhaut;
  retourenhaut = 1;
  
  //   remplir toute la page directement?  1 - oui / 0 - non
  int toutelapage;
  toutelapage = 1;
  
  
  
  
  
  
  
  
  
  
  //   PROGRAMME
  
  
  
  
  
  
  
  
  
  
  if (declencheur > -1){
    declencheur = declencheur + 1;
  }
  
  
  
  if (declencheur > vitessedeclencheur){
    declencheur = 0;
    
    a = a + random(-deplacementvertical,+deplacementvertical);
    b = b + random(-deplacementvertical,+deplacementvertical);
    c = c + random(-deplacementvertical,+deplacementvertical);
    d = d + random(-deplacementvertical,+deplacementvertical);
    e = e + random(-deplacementvertical,+deplacementvertical);
    f = f + random(-deplacementvertical,+deplacementvertical);
    g = g + random(-deplacementvertical,+deplacementvertical);
    h = h + random(-deplacementvertical,+deplacementvertical);
    i = i + random(-deplacementvertical,+deplacementvertical);
    j = j + random(-deplacementvertical,+deplacementvertical);
    k = k + random(-deplacementvertical,+deplacementvertical);
    l = l + random(-deplacementvertical,+deplacementvertical);
    m = m + random(-deplacementvertical,+deplacementvertical);
    n = n + random(-deplacementvertical,+deplacementvertical);
    o = o + random(-deplacementvertical,+deplacementvertical);
    p = p + random(-deplacementvertical,+deplacementvertical);
    q = q + random(-deplacementvertical,+deplacementvertical);
    r = r + random(-deplacementvertical,+deplacementvertical);
    s = s + random(-deplacementvertical,+deplacementvertical);
    t = t + random(-deplacementvertical,+deplacementvertical);
    u = u + random(-deplacementvertical,+deplacementvertical);
    v = v + random(-deplacementvertical,+deplacementvertical);
    w = w + random(-deplacementvertical,+deplacementvertical);
    
    
    if (deplacementhorizontal < 1){
      deplacementh = deplacementh + vitesseh;}
    
    if (deplacementhorizontal > 0){
      deplacementh = deplacementh + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);}
      
    deplacementha = deplacementha + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhb = deplacementhb + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhc = deplacementhc + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhd = deplacementhd + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhe = deplacementhe + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhf = deplacementhf + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhg = deplacementhg + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhh = deplacementhh + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhi = deplacementhi + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhj = deplacementhj + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhk = deplacementhk + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhl = deplacementhl + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhm = deplacementhm + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhn = deplacementhn + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementho = deplacementho + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhp = deplacementhp + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhq = deplacementhq + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhr = deplacementhr + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacemenths = deplacemenths + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementht = deplacementht + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhu = deplacementhu + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhv = deplacementhv + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    deplacementhw = deplacementhw + random (-vitessehaleatoire + reductionvitesseha , vitessehaleatoire);
    
  }
  
if (deplacementegal > 0){
  if (deplacementh > width){
    if (placementdebutr > 0){
    debuta = debuta + 23*espacement;
    debutb = debutb + 23*espacement;
    debutc = debutc + 23*espacement;
    debutd = debutd + 23*espacement;
    debute = debute + 23*espacement;
    debutf = debutf + 23*espacement;
    debutg = debutg + 23*espacement;
    debuth = debuth + 23*espacement;
    debuti = debuti + 23*espacement;
    debutj = debutj + 23*espacement;
    debutk = debutk + 23*espacement;
    debutl = debutl + 23*espacement;
    debutm = debutm + 23*espacement;
    debutn = debutn + 23*espacement;
    debuto = debuto + 23*espacement;
    debutp = debutp + 23*espacement;
    debutq = debutq + 23*espacement;
    debutr = debutr + 23*espacement;
    debuts = debuts + 23*espacement;
    debutt = debutt + 23*espacement;
    debutu = debutu + 23*espacement;
    debutv = debutv + 23*espacement;
    debutw = debutw + 23*espacement;}
    
    if (placementdebutr < 1){
    debuta = a + random(0,23)*espacement;
    debutb = b + random(0,23)*espacement;
    debutc = c + random(0,23)*espacement;
    debutd = d + random(0,23)*espacement;
    debute = e + random(0,23)*espacement;
    debutf = f + random(0,23)*espacement;
    debutg = g + random(0,23)*espacement;
    debuth = h + random(0,23)*espacement;
    debuti = i + random(0,23)*espacement;
    debutj = j + random(0,23)*espacement;
    debutk = k + random(0,23)*espacement;
    debutl = l + random(0,23)*espacement;
    debutm = m + random(0,23)*espacement;
    debutn = n + random(0,23)*espacement;
    debuto = o + random(0,23)*espacement;
    debutp = p + random(0,23)*espacement;
    debutq = q + random(0,23)*espacement;
    debutr = r + random(0,23)*espacement;
    debuts = s + random(0,23)*espacement;
    debutt = t + random(0,23)*espacement;
    debutu = u + random(0,23)*espacement;
    debutv = v + random(0,23)*espacement;
    debutw = w + random(0,23)*espacement;}
    
    deplacementh = 0;
    
    if (placementverticalr > 0){
      a = 0;
      b = 0;
      c = 0;
      d = 0;
      e = 0;
      f = 0;
      g = 0;
      h = 0;
      i = 0;
      j = 0;
      k = 0;
      l = 0;
      m = 0;
      n = 0;
      o = 0;
      p = 0;
      q = 0;
      r = 0;
      s = 0;
      t = 0;
      u = 0;
      v = 0;
      w = 0;
    }
    
    if (retourenhaut > 0){
      if (debuta + a > height){ debuta = 1*espacement; a = 0; }
      if (debutb + b > height){ debutb = 2*espacement; b = 0; }
      if (debutc + c > height){ debutc = 3*espacement; c = 0; }
      if (debutd + d > height){ debutd = 4*espacement; d = 0; }
      if (debute + e > height){ debute = 5*espacement; e = 0; }
      if (debutf + f > height){ debutf = 6*espacement; f = 0; }
      if (debutg + g > height){ debutg = 7*espacement; g = 0; }
      if (debuth + h > height){ debuth = 8*espacement; h = 0; }
      if (debuti + i > height){ debuti = 9*espacement; i = 0; }
      if (debutj + j > height){ debutj = 10*espacement; j = 0; }
      if (debutk + k > height){ debutk = 11*espacement; k = 0; }
      if (debutl + l > height){ debutl = 12*espacement; l = 0; }
      if (debutm + m > height){ debutm = 13*espacement; m = 0; }
      if (debutn + n > height){ debutn = 14*espacement; n = 0; }
      if (debuto + o > height){ debuto = 15*espacement; o = 0; }
      if (debutp + p > height){ debutp = 16*espacement; p = 0; }
      if (debutq + q > height){ debutq = 17*espacement; q = 0; }
      if (debutr + r > height){ debutr = 18*espacement; r = 0; }
      if (debuts + s > height){ debuts = 19*espacement; s = 0; }
      if (debutt + t > height){ debutt = 20*espacement; t = 0; }
      if (debutu + u > height){ debutu = 21*espacement; u = 0; }
      if (debutv + v > height){ debutv = 22*espacement; v = 0; }
      if (debutw + w > height){ debutw = 23*espacement; w = 0; }}
    
    a = a+debuta;
    b = b+debutb;
    c = c+debutc;
    d = d+debutd;
    e = e+debute;
    f = f+debutf;
    g = g+debutg;
    h = h+debuth;
    i = i+debuti;
    j = j+debutj;
    k = k+debutk;
    l = l+debutl;
    m = m+debutm;
    n = n+debutn;
    o = o+debuto;
    p = p+debutp;
    q = q+debutq;
    r = r+debutr;
    s = s+debuts;
    t = t+debutt;
    u = u+debutu;
    v = v+debutv;
    w = w+debutw;
  }}
  
  
  
  
  
  // - - - - - - - - - - - - - - - - -
  
  
  
  
  
  if (deplacementegal < 1){
    
    if (deplacementha > width){ if (placementdebutr > 0){ debuta = debuta + 23*espacement;} if (placementdebutr < 1){ debuta = a + random(0,23)*espacement;} deplacementha = 0; if (placementverticalr > 0){ a = 0;} if (retourenhaut > 0){ if (debuta + a > height){ debuta = 1*espacement; a = 0; deplacementha = 0; }} a = a+debuta;}
    if (deplacementhb > width){ if (placementdebutr > 0){ debutb = debutb + 23*espacement;} if (placementdebutr < 1){ debutb = b + random(0,23)*espacement;} deplacementhb = 0; if (placementverticalr > 0){ b = 0;} if (retourenhaut > 0){ if (debutb + b > height){ debutb = 2*espacement; b = 0; deplacementhb = 0; }} b = b+debutb;}
    if (deplacementhc > width){ if (placementdebutr > 0){ debutc = debutc + 23*espacement;} if (placementdebutr < 1){ debutc = c + random(0,23)*espacement;} deplacementhc = 0; if (placementverticalr > 0){ c = 0;} if (retourenhaut > 0){ if (debutc + c > height){ debutc = 3*espacement; c = 0; deplacementhc = 0; }} c = c+debutc;}
    if (deplacementhd > width){ if (placementdebutr > 0){ debutd = debutd + 23*espacement;} if (placementdebutr < 1){ debutc = d + random(0,23)*espacement;} deplacementhd = 0; if (placementverticalr > 0){ d = 0;} if (retourenhaut > 0){ if (debutd + d > height){ debutd = 4*espacement; d = 0; deplacementhd = 0; }} d = d+debutd;}
    if (deplacementhe > width){ if (placementdebutr > 0){ debute = debute + 23*espacement;} if (placementdebutr < 1){ debute = e + random(0,23)*espacement;} deplacementhe = 0; if (placementverticalr > 0){ e = 0;} if (retourenhaut > 0){ if (debute + e > height){ debute = 5*espacement; e = 0; deplacementhe = 0; }} e = e+debute;}
    if (deplacementhf > width){ if (placementdebutr > 0){ debutf = debutf + 23*espacement;} if (placementdebutr < 1){ debutf = f + random(0,23)*espacement;} deplacementhf = 0; if (placementverticalr > 0){ f = 0;} if (retourenhaut > 0){ if (debutf + f > height){ debutf = 1*espacement; f = 0; deplacementhf = 0; }} f = f+debutf;}
    if (deplacementhg > width){ if (placementdebutr > 0){ debutg = debutg + 23*espacement;} if (placementdebutr < 1){ debutg = g + random(0,23)*espacement;} deplacementhg = 0; if (placementverticalr > 0){ g = 0;} if (retourenhaut > 0){ if (debutg + g > height){ debutg = 2*espacement; g = 0; deplacementhg = 0; }} g = g+debutg;}
    if (deplacementhh > width){ if (placementdebutr > 0){ debuth = debuth + 23*espacement;} if (placementdebutr < 1){ debuth = h + random(0,23)*espacement;} deplacementhh = 0; if (placementverticalr > 0){ h = 0;} if (retourenhaut > 0){ if (debuth + h > height){ debuth = 3*espacement; h = 0; deplacementhh = 0; }} h = h+debuth;}
    if (deplacementhi > width){ if (placementdebutr > 0){ debuti = debuti + 23*espacement;} if (placementdebutr < 1){ debuti = i + random(0,23)*espacement;} deplacementhi = 0; if (placementverticalr > 0){ i = 0;} if (retourenhaut > 0){ if (debuti + i > height){ debuti = 4*espacement; i = 0; deplacementhi = 0; }} i = i+debuti;}
    if (deplacementhj > width){ if (placementdebutr > 0){ debutj = debutj + 23*espacement;} if (placementdebutr < 1){ debutj = j + random(0,23)*espacement;} deplacementhj = 0; if (placementverticalr > 0){ j = 0;} if (retourenhaut > 0){ if (debutj + j > height){ debutj = 5*espacement; j = 0; deplacementhj = 0; }} j = j+debutj;}
    if (deplacementhk > width){ if (placementdebutr > 0){ debutk = debutk + 23*espacement;} if (placementdebutr < 1){ debutk = k + random(0,23)*espacement;} deplacementhk = 0; if (placementverticalr > 0){ k = 0;} if (retourenhaut > 0){ if (debutk + k > height){ debutk = 1*espacement; k = 0; deplacementhk = 0; }} k = k+debutk;}
    if (deplacementhl > width){ if (placementdebutr > 0){ debutl = debutl + 23*espacement;} if (placementdebutr < 1){ debutl = l + random(0,23)*espacement;} deplacementhl = 0; if (placementverticalr > 0){ l = 0;} if (retourenhaut > 0){ if (debutl + l > height){ debutl = 2*espacement; l = 0; deplacementhl = 0; }} l = l+debutl;}
    if (deplacementhm > width){ if (placementdebutr > 0){ debutm = debutm + 23*espacement;} if (placementdebutr < 1){ debutm = m + random(0,23)*espacement;} deplacementhm = 0; if (placementverticalr > 0){ m = 0;} if (retourenhaut > 0){ if (debutm + m > height){ debutm = 3*espacement; m = 0; deplacementhm = 0; }} m = m+debutm;}
    if (deplacementhn > width){ if (placementdebutr > 0){ debutn = debutn + 23*espacement;} if (placementdebutr < 1){ debutn = n + random(0,23)*espacement;} deplacementhn = 0; if (placementverticalr > 0){ n = 0;} if (retourenhaut > 0){ if (debutn + n > height){ debutn = 4*espacement; n = 0; deplacementhn = 0; }} n = n+debutn;}
    if (deplacementho > width){ if (placementdebutr > 0){ debuto = debuto + 23*espacement;} if (placementdebutr < 1){ debuto = o + random(0,23)*espacement;} deplacementho = 0; if (placementverticalr > 0){ o = 0;} if (retourenhaut > 0){ if (debuto + o > height){ debuto = 5*espacement; o = 0; deplacementho = 0; }} o = o+debuto;}
    if (deplacementhp > width){ if (placementdebutr > 0){ debutp = debutp + 23*espacement;} if (placementdebutr < 1){ debutp = p + random(0,23)*espacement;} deplacementhp = 0; if (placementverticalr > 0){ p = 0;} if (retourenhaut > 0){ if (debutp + p > height){ debutp = 1*espacement; p = 0; deplacementhp = 0; }} p = p+debutp;}
    if (deplacementhq > width){ if (placementdebutr > 0){ debutq = debutq + 23*espacement;} if (placementdebutr < 1){ debutq = q + random(0,23)*espacement;} deplacementhq = 0; if (placementverticalr > 0){ q = 0;} if (retourenhaut > 0){ if (debutq + q > height){ debutq = 2*espacement; q = 0; deplacementhq = 0; }} q = q+debutq;}
    if (deplacementhr > width){ if (placementdebutr > 0){ debutr = debutr + 23*espacement;} if (placementdebutr < 1){ debutr = r + random(0,23)*espacement;} deplacementhr = 0; if (placementverticalr > 0){ r = 0;} if (retourenhaut > 0){ if (debutr + r > height){ debutr = 3*espacement; r = 0; deplacementhr = 0; }} r = r+debutr;}
    if (deplacemenths > width){ if (placementdebutr > 0){ debuts = debuts + 23*espacement;} if (placementdebutr < 1){ debuts = s + random(0,23)*espacement;} deplacemenths = 0; if (placementverticalr > 0){ s = 0;} if (retourenhaut > 0){ if (debuts + s > height){ debuts = 4*espacement; s = 0; deplacemenths = 0; }} s = s+debuts;}
    if (deplacementht > width){ if (placementdebutr > 0){ debutt = debutt + 23*espacement;} if (placementdebutr < 1){ debutt = t + random(0,23)*espacement;} deplacementht = 0; if (placementverticalr > 0){ t = 0;} if (retourenhaut > 0){ if (debutt + t > height){ debutt = 5*espacement; t = 0; deplacementht = 0; }} t = t+debutt;}
    if (deplacementhu > width){ if (placementdebutr > 0){ debutu = debutu + 23*espacement;} if (placementdebutr < 1){ debutu = u + random(0,23)*espacement;} deplacementhu = 0; if (placementverticalr > 0){ u = 0;} if (retourenhaut > 0){ if (debutu + u > height){ debutu = 1*espacement; u = 0; deplacementhu = 0; }} u = u+debutu;}
    if (deplacementhv > width){ if (placementdebutr > 0){ debutv = debutv + 23*espacement;} if (placementdebutr < 1){ debutv = v + random(0,23)*espacement;} deplacementhv = 0; if (placementverticalr > 0){ v = 0;} if (retourenhaut > 0){ if (debutv + v > height){ debutv = 2*espacement; v = 0; deplacementhv = 0; }} v = v+debutv;}
    if (deplacementhw > width){ if (placementdebutr > 0){ debutw = debutw + 23*espacement;} if (placementdebutr < 1){ debutw = w + random(0,23)*espacement;} deplacementhw = 0; if (placementverticalr > 0){ w = 0;} if (retourenhaut > 0){ if (debutw + w > height){ debutw = 3*espacement; w = 0; deplacementhw = 0; }} w = w+debutw;}
  }
  
  
  
  
  
  //   DRAW
  
  
  
  
  
  //background (0);
  
  //fill (0,1);
  //rect (0,0,width,height);
  
  
  fill (couleurlignes);
  noStroke ();
  
  
  
  if (deplacementegal > 0){
  if (toutelapage < 1){
    ellipse (deplacementh,a,taillee,taillee);
    ellipse (deplacementh,b,taillee,taillee);
    ellipse (deplacementh,c,taillee,taillee);
    ellipse (deplacementh,d,taillee,taillee);
    ellipse (deplacementh,e,taillee,taillee);
    ellipse (deplacementh,f,taillee,taillee);
    ellipse (deplacementh,g,taillee,taillee);
    ellipse (deplacementh,h,taillee,taillee);
    ellipse (deplacementh,i,taillee,taillee);
    ellipse (deplacementh,j,taillee,taillee);
    ellipse (deplacementh,k,taillee,taillee);
    ellipse (deplacementh,l,taillee,taillee);
    ellipse (deplacementh,m,taillee,taillee);
    ellipse (deplacementh,n,taillee,taillee);
    ellipse (deplacementh,o,taillee,taillee);
    ellipse (deplacementh,p,taillee,taillee);
    ellipse (deplacementh,q,taillee,taillee);
    ellipse (deplacementh,r,taillee,taillee);
    ellipse (deplacementh,s,taillee,taillee);
    ellipse (deplacementh,t,taillee,taillee);
    ellipse (deplacementh,u,taillee,taillee);
    ellipse (deplacementh,v,taillee,taillee);
    ellipse (deplacementh,w,taillee,taillee);}}
  
  
  
  if (deplacementegal > 0){
  if (toutelapage > 0){
    for (int multiple=0; multiple<height; multiple=multiple+23*espacement){
    ellipse (deplacementh,multiple+a,taillee,taillee);
    ellipse (deplacementh,multiple+b,taillee,taillee);
    ellipse (deplacementh,multiple+c,taillee,taillee);
    ellipse (deplacementh,multiple+d,taillee,taillee);
    ellipse (deplacementh,multiple+e,taillee,taillee);
    ellipse (deplacementh,multiple+f,taillee,taillee);
    ellipse (deplacementh,multiple+g,taillee,taillee);
    ellipse (deplacementh,multiple+h,taillee,taillee);
    ellipse (deplacementh,multiple+i,taillee,taillee);
    ellipse (deplacementh,multiple+j,taillee,taillee);
    fill (255,15);
    ellipse (deplacementh,multiple+k,taillee,taillee);
    ellipse (deplacementh,multiple+l,taillee,taillee);
    fill (couleurlignes);
    ellipse (deplacementh,multiple+m,taillee,taillee);
    ellipse (deplacementh,multiple+n,taillee,taillee);
    fill (255,15);
    ellipse (deplacementh,multiple+o,taillee,taillee);
    ellipse (deplacementh,multiple+p,taillee,taillee);
    fill (couleurlignes);
    ellipse (deplacementh,multiple+q,taillee,taillee);
    ellipse (deplacementh,multiple+r,taillee,taillee);
    fill (255,15);
    ellipse (deplacementh,multiple+s,taillee,taillee);
    ellipse (deplacementh,multiple+t,taillee,taillee);
    fill (couleurlignes);
    ellipse (deplacementh,multiple+u,taillee,taillee);
    ellipse (deplacementh,multiple+v,taillee,taillee);
    fill (255,15);
    ellipse (deplacementh,multiple+w,taillee,taillee);}}}
  
  
  
  
  
  if (deplacementegal < 1){
  if (toutelapage < 1){
    ellipse (deplacementha,a,taillee,taillee);
    ellipse (deplacementhb,b,taillee,taillee);
    ellipse (deplacementhc,c,taillee,taillee);
    ellipse (deplacementhd,d,taillee,taillee);
    ellipse (deplacementhe,e,taillee,taillee);
    ellipse (deplacementhf,f,taillee,taillee);
    ellipse (deplacementhg,g,taillee,taillee);
    ellipse (deplacementhh,h,taillee,taillee);
    ellipse (deplacementhi,i,taillee,taillee);
    ellipse (deplacementhj,j,taillee,taillee);
    ellipse (deplacementhk,k,taillee,taillee);
    ellipse (deplacementhl,l,taillee,taillee);
    ellipse (deplacementhm,m,taillee,taillee);
    ellipse (deplacementhn,n,taillee,taillee);
    ellipse (deplacementho,o,taillee,taillee);
    ellipse (deplacementhp,p,taillee,taillee);
    ellipse (deplacementhq,q,taillee,taillee);
    ellipse (deplacementhr,r,taillee,taillee);
    ellipse (deplacemenths,s,taillee,taillee);
    ellipse (deplacementht,t,taillee,taillee);
    ellipse (deplacementhu,u,taillee,taillee);
    ellipse (deplacementhv,v,taillee,taillee);
    ellipse (deplacementhw,w,taillee,taillee);}}
  
  
  
  if (deplacementegal < 1){
  if (toutelapage > 0){
    for (int multiple=0; multiple<height; multiple=multiple+23*espacement){
    ellipse (deplacementha,multiple+a,taillee,taillee);
    ellipse (deplacementhb,multiple+b,taillee,taillee);
    ellipse (deplacementhc,multiple+c,taillee,taillee);
    ellipse (deplacementhd,multiple+d,taillee,taillee);
    ellipse (deplacementhe,multiple+e,taillee,taillee);
    ellipse (deplacementhf,multiple+f,taillee,taillee);
    ellipse (deplacementhg,multiple+g,taillee,taillee);
    ellipse (deplacementhh,multiple+h,taillee,taillee);
    ellipse (deplacementhi,multiple+i,taillee,taillee);
    ellipse (deplacementhj,multiple+j,taillee,taillee);
    ellipse (deplacementhk,multiple+k,taillee,taillee);
    ellipse (deplacementhl,multiple+l,taillee,taillee);
    ellipse (deplacementhm,multiple+m,taillee,taillee);
    ellipse (deplacementhn,multiple+n,taillee,taillee);
    ellipse (deplacementho,multiple+o,taillee,taillee);
    ellipse (deplacementhp,multiple+p,taillee,taillee);
    ellipse (deplacementhq,multiple+q,taillee,taillee);
    ellipse (deplacementhr,multiple+r,taillee,taillee);
    ellipse (deplacemenths,multiple+s,taillee,taillee);
    ellipse (deplacementht,multiple+t,taillee,taillee);
    ellipse (deplacementhu,multiple+u,taillee,taillee);
    ellipse (deplacementhv,multiple+v,taillee,taillee);
    ellipse (deplacementhw,multiple+w,taillee,taillee);}}}
  
  
  
  fill (0);
  //rect (5,declencheur,5,5);
  //rect (15,debuta,5,5);
  
}
