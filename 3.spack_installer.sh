#!/bin/bash

# Load Spack environment (adjust if needed)
SPACK_DIR="/root/Sanket/spack"
source "$SPACK_DIR/share/spack/setup-env.sh"

COMPILER="gcc"

echo "📦 Checking and installing HPC apps using Spack..."


# --------- GROMACS ----------
echo " "
echo "Checking for GROMACS..."
if spack find gromacs | grep -q gromacs; then
    echo "✅ GROMACS is already installed."
else
    echo "❌ GROMACS not found. Installing..."
    spack install -j40 gromacs%$COMPILER
fi

# --------- LAMMPS ----------
sleep
echo " "
echo "Checking for lammps..."
if spack find lammps | grep -q lammps; then
    echo "✅ Lammps is already installed."
else
    echo "❌ Lammps not found. Installing..."
    spack install -j40 lammps%$COMPILER
fi

# --------- NAMD ----------
sleep
echo " "
echo "Checking for NAMD..."
if spack find namd | grep -q namd; then
    echo "✅ namd is already installed."
else
    echo "❌ namd not found. Installing..."
    makdir namd
    cd namd
    wget https://www.ks.uiuc.edu/Research/namd/2.14/download/946183/NAMD_2.14_Source.tar.gz
    spack install -j40 namd%$COMPILER
    cd -
fi


# --------- OPENFOAM ----------
sleep 1
echo " "
echo "Checking for OpenFOAM..."
if spack find openfoam | grep -q openfoam; then
    echo "✅ OpenFOAM is already installed."
else
    echo "❌ OpenFOAM not found. Installing..."
    spack install -j40 openfoam%$COMPILER+vtk+paraview
fi

# --------- WRF ----------
echo " "
sleep 1
echo "Checking for WRF..."
if spack find wrf | grep -q wrf; then
    echo "✅ WRF is already installed."
else
    echo "❌ WRF not found. Installing..."
    spack install -j40 wrf%$COMPILER
fi

echo "🏁 Done."


# --------- nwchem----------
echo " "
sleep 1
echo "Checking for nwchem..."
if spack find nwchem | grep -q nwchem; then
    echo "✅ nwchem is already installed."
else
    echo "❌ nwchem not found. Installing..."
    spack install -j40 nwchem%$COMPILER
fi

echo "🏁 Done."


# --------- abinit ----------
echo " "
sleep 1
echo "Checking for abinit..."
if spack find abinit | grep -q abinit; then
    echo "✅ abinit is already installed."
else
    echo "❌ abinit not found. Installing..."
    spack install -j40 abinit%$COMPILER
fi

echo "🏁 Done."

# --------- cp2k ----------
echo " "
sleep 1
echo "Checking for cp2k..."
if spack find cp2k | grep -q cp2k; then
    echo "✅ cp2k is already installed."
else
    echo "❌ cp2k not found. Installing..."
    spack install -j40 cp2k%$COMPILER
fi

echo "🏁 Done."

# --------- hmmer ----------

echo " "
sleep 1
echo "Checking for hmmer..."
if spack find hmmer | grep -q hmmer; then
    echo "✅ hmmer is already installed."
else
    echo "❌ hmmer not found. Installing..."
    spack install -j40 hmmer%$COMPILER
fi

echo "🏁 Done."

# --------- mummer ----------

echo " "
sleep 1
echo "Checking for mummer..."
if spack find mummer | grep -q mummer; then
    echo "✅ mummer is already installed."
else
    echo "❌ mummer not found. Installing..."
    spack install -j40 mummer%$COMPILER
fi

echo "🏁 Done."

# --------- Quantum-espresso ----------

echo " "
sleep 1
echo "Checking for quantum-espresso..."
if spack find quantum-espresso | grep -q quantum-espresso; then
    echo "✅ quantum-espresso is already installed."
else
    echo "❌ quantum-espresso not found. Installing..."
    spack install -j40 quantum-espresso%$COMPILER
fi

echo "🏁 Done."

# --------- HPL ----------

echo " "
sleep 1
echo "Checking for HPL..."
if spack find hpl | grep -q hpl; then
    echo "✅ HPL is already installed."
else
    echo "❌ HPL not found. Installing..."
    spack install -j40 hpl%$COMPILER
fi

echo "🏁 Done."
