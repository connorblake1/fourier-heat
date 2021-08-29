Flow[][] f;
final float k = .1;
final int density = 2;
final float max= 1000;
void setup() {
  noStroke();
  colorMode(HSB,360,100,100);
  size(600,600);
  f = new Flow[width/density][height/density];
  for (int x = 0; x < width/density; x++) {
    for (int y = 0; y < width/density; y++) {
      if (sqrt(sq(x-width/4/density)+sq(y-height/4/density)) < 100/density || sqrt(sq(x-3*width/4/density)+sq(y-3*height/4/density)) < 100/density) {
        f[x][y] = new Flow(max);}
      else {
        f[x][y] = new Flow(1);}}}
  //for (int x = 0; x < width/density; x++) {
  //  for (int y = 0; y < width/density; y++) {
  //    println(f[x][y].gt());}}
}

void draw() {
  Flow[][] f1 = copyThis(f);
  for (int x = 0; x < width/density; x++) {
    for (int y = 0; y < height/density; y++) {
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            if (i != 0 && j!= 0 && x+i != -1 && y+j != -1 && x+i!= f.length && y+j!= f[0].length) {
              float l = sqrt(sq(i)+sq(j));
              float c = f1[x][y].gt()-f1[x+i][y+j].gt();
                f[x][y].st(f[x][y].gt()-k*c/l);
                f[x+i][y+j].st(f[x+i][y+j].gt()+k*c/l);
            }
  }}}}
  sketch(f);
}
void sketch(Flow[][] m) {
  for (int x = 0; x < m.length; x++) {
    for (int y = 0; y < m[0].length; y++) {
      fill(map(m[x][y].gt(),0,max,240,0),100,100);
      rect(x*density,y*density,(x+1)*density,(y+1)*density);
      //point(x,y);
  }}  
}
Flow [][] copyThis(Flow [][] m) {
  Flow[][] f2 = new Flow[m.length][m[0].length];
  for (int x = 0; x < f2.length;x++) {
    for (int y = 0; y < f2[0].length; y++) {
      f2[x][y] = new Flow(m[x][y].gt());}}
  return f2;
  }
