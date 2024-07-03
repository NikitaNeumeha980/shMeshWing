. $WM_PROJECT_DIR/bin/tools/RunFunctions

application=$(getApplication)

# Конвертация сетки, проверка, масштабирование
# rm -r postProcessing*
# rm -r 0
# cp -r 0.orig 0
# cp -r 1
# cp -r 2
runApplication -o\
    blockMesh

runApplication -o\
    checkMesh -allGeometry -allTopology

# runApplication -o\
#     paraFoam

runApplication -o\
    decomposePar -force

runParallel -o\
    snappyHexMesh -overwrite

runApplication -o\
    reconstructParMesh -constant

# rm -rf processor*

exit 0
