const asic = document.querySelector('.asicMiner');
const gpu = document.querySelector('.gpu');
const rig = document.querySelector('.minerig');
const asic3d = document.querySelector('.asic3d');
const gpu3d = document.querySelector('.gpu3d');
const rig3d = document.querySelector('.minerig3d');
const tituloasic = document.querySelector('.tituloAsic');
const titulogpu = document.querySelector('.tituloGPU');
const titulorig = document.querySelector('.tituloRig');

asic.addEventListener('click', function(){
    asic3d.classList.add('ativo');
    gpu3d.classList.remove('ativo');
    rig3d.classList.remove('ativo');
    asic.classList.add('selecionado');
    gpu.classList.remove('selecionado');
    rig.classList.remove('selecionado');
    tituloasic.classList.add('ativo');
    titulogpu.classList.remove('ativo');
    titulorig.classList.remove('ativo');
});

gpu.addEventListener('click', function(){
    asic3d.classList.remove('ativo');
    gpu3d.classList.add('ativo');
    rig3d.classList.remove('ativo');
    asic.classList.remove('selecionado');
    gpu.classList.add('selecionado');
    rig.classList.remove('selecionado');
    tituloasic.classList.remove('ativo');
    titulogpu.classList.add('ativo');
    titulorig.classList.remove('ativo');
});

rig.addEventListener('click', function(){
    asic3d.classList.remove('ativo');
    gpu3d.classList.remove('ativo');
    rig3d.classList.add('ativo');
    asic.classList.remove('selecionado');
    gpu.classList.remove('selecionado');
    rig.classList.add('selecionado');
    tituloasic.classList.remove('ativo');
    titulogpu.classList.remove('ativo');
    titulorig.classList.add('ativo');
});