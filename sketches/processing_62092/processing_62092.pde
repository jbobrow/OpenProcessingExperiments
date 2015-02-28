
class Alphabet
{
  Symbol A,B,C,D,E,F,G,H,I,J,KQ,L,M,N,O,P,R,S,T,UV,W,X,Y,Z;
  
  Alphabet()
  {
    A = new Symbol(false, false, false, false, false,
                   true, true, false, true, true,
                   false, true, true, true, false,
                   false, false, false, false, false,
                   false, false, false, false, false);
    B = new Symbol(false, false, false, false, false,
                   false, true, true, true, false,
                   false, true, false, true, false,
                   true, true, true, true, false,
                   false, false, false, false, false);
    C = new Symbol(false, false, false, false, false,
                   false, false, false, true, true,
                   false, false, false, true, false,
                   false, false, false, true, true,
                   false, false, false, false, false);
    D = new Symbol(false, false, false, false, false,
                   false, false, false, false, false,
                   false, false, false, false, false,
                   true, true, false, false, false,
                   false, true, false, false, false);
    E = new Symbol(false, false, false, false, false,
                   true, true, false, false, false,
                   false, true, false, false, false,
                   false, true, true, true, true,
                   false, false, false, false, false);
    F = new Symbol(false, false, false, false, false,
                   false, true, false, true, false,
                   true, true, true, true, false,
                   false, true, false, true, false,
                   false, false, false, false, false);
    G = new Symbol(false, false, false, true, false,
                   false, false, true, true, false,
                   false, false, true, false, false,
                   false, false, true, true, false,
                   false, false, false, true, false);
    H = new Symbol(false, false, false, false, false,
                   false, true, true, true, false,
                   false, true, false, true, false,
                   false, true, true, true, false,
                   false, false, false, true, false);
    I = new Symbol(false, true, false, true, false,
                   false, true, true, true, false,
                   false, false, false, false, false,
                   false, false, false, false, false,
                   false, false, false, false, false);
    J = new Symbol(false, false, false, false, false,
                   false, false, false, false, false,
                   false, false, false, false, false,
                   false, false, false, true, true,
                   false, false, false, true, false);
    KQ = new Symbol(false, false, false, true, false,
                   false, false, false, true, false,
                   false, false, false, true, false,
                   false, true, true, true, false,
                   false, true, false, false, false);
    L = new Symbol(false, false, false, false, false,
                   false, true, true, true, false,
                   false, false, true, false, false,
                   false, true, true, true, false,
                   false, false, true, false, false);
    M = new Symbol(false, false, false, false, false,
                   false, false, false, false, false,
                   false, true, true, true, false,
                   true, true, false, true, true,
                   false, false, false, false, false);
    N = new Symbol(false, false, false, false, false,
                   false, true, true, true, true,
                   false, true, false, true, false,
                   false, true, true, true, false,
                   false, false, false, false, false);
    O = new Symbol(false, false, false, false, false,
                   true, true, false, false, false,
                   false, true, false, false, false,
                   true, true, false, false, false,
                   false, false, false, false, false);
    P = new Symbol(false, false, false, true, false,
                   false, false, false, true, true,
                   false, false, false, false, false,
                   false, false, false, false, false,
                   false, false, false, false, false);
    R = new Symbol(false, false, false, false, false,
                   false, true, false, true, false,
                   false, true, true, true, true,
                   false, true, false, true, false,
                   false, false, false, false, false);
    S = new Symbol(false, true, false, false, false,
                   false, true, true, false, false,
                   false, false, true, false, false,
                   false, true, true, false, false,
                   false, true, false, false, false);
    T = new Symbol(false, true, false, false, false,
                   false, true, true, true, false,
                   false, true, false, true, false,
                   false, true, true, true, false,
                   false, false, false, false, false);
    UV = new Symbol(false, false, false, false, false,
                   false, false, false, false, false,
                   false, false, false, false, false,
                   false, true, true, true, false,
                   false, true, false, true, false);
    W = new Symbol(false, true, false, false, false,
                   true, true, false, false, false,
                   false, false, false, false, false,
                   false, false, false, false, false,
                   false, false, false, false, false);
    X = new Symbol(false, false, false, true, false,
                   false, true, true, true, false,
                   false, true, false, false, false,
                   false, true, false, false, false,
                   false, true, false, false, false);
    Y = new Symbol(false, false, true, false, false,
                   false, true, true, true, false,
                   false, false, true, false, false,
                   false, true, true, true, false,
                   false, false, false, false, false);
    Z = new Symbol(false, false, false, false, false,
                   true, true, true, true, false,
                   false, false, false, true, false,
                   false, false, false, true, true,
                   false, false, false, false, false);
  }
  
  String checkChar(Symbol s)
  {
     if (s.compare(A))  return "A";
    else if (s.compare(B))  return "B";
    else if (s.compare(C))  return "C";
    else if (s.compare(D))  return "D";
    else if (s.compare(E))  return "E";
    else if (s.compare(F))  return "F";
    else if (s.compare(G))  return "G";
    else if (s.compare(H))  return "H";
    else if (s.compare(I))  return "I";
    else if (s.compare(J))  return "J";
    else if (s.compare(KQ))  return "K/Q";
    else if (s.compare(L))  return "L";
    else if (s.compare(M))  return "M";
    else if (s.compare(N))  return "N";
    else if (s.compare(O))  return "O";
    else if (s.compare(P))  return "P";
    else if (s.compare(R))  return "R";
    else if (s.compare(S))  return "S";
    else if (s.compare(T))  return "T";
    else if (s.compare(UV))  return "U/V";
    else if (s.compare(W))  return "W";
    else if (s.compare(X))  return "X";
    else if (s.compare(Y))  return "Y";
    else if (s.compare(Z))  return "Z";
    return "";
  }
}

