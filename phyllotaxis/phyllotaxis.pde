PImage bkg;
PImage im;
PGraphics phyllo;

void setup() {
  size(1000, 1000);
  //bkg = loadImage("black.jpg");
  //im = loadImage("two 500 color.jpg");
  phyllo = createGraphics(1000, 1000);
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  //ellipse(mouseX, mouseY, 200, 200);
  //translate(-width/2, -height/2);
  //image(bkg, mouseX, mouseY);
  //loadPixels();
  //im.loadPixels();
  //for (int i = 0; i < pixels.length; i++) {
  //  pixels[i] = pixels[i] ^ im.pixels[i] | 0xff000000;
  //}
  //updatePixels();
  drawPhyllo();
  blend(phyllo, 0, 0, 1000, 1000, 0, 0, 1000, 1000, DIFFERENCE);
}


/////////////////////////////////////////////////
/////////// Phyllo Section //////////////////////
/////////////////////////////////////////////////

int numFlorets = 500;
float angleFloret = 137.5;
int scaleFloret = 15;

void drawPhyllo() {
  phyllo.beginDraw();
  phyllo.background(255);
  phyllo.translate(width/2, height/2);
  for (int i=0; i<numFlorets; i++) {
    float radius = scaleFloret*sqrt(i);
    float angle = i*angleFloret;
    
    float posx = radius*cos(angle);
    float posy = radius*sin(angle);
    
    phyllo.fill(0);
    phyllo.ellipse(posx, posy, 10, 10);
  }
  angleFloret = angleFloret + 0.0001;
  phyllo.endDraw();
}