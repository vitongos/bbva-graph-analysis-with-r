Demos and sources for Graph Analysis with R
===========================================

Setup
-----------

Run following commands in terminal to setup your environment for the demos.

### Cloning the repository from Github
```bash
sudo yum -y install git
cd
git clone https://github.com/vitongos/bbva-graph-analysis-with-r graph-src
chmod +x graph-src/deploy/*.sh
```

### Installing R and RStudio 0.97
```bash
cd ~/graph-src/
deploy/r.sh
```

### Installing R packages
```bash
cd ~/graph-src/deploy
sudo R --no-save < setup.R
```

