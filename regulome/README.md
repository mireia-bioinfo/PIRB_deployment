# task list for deployment

  - setup deploy keys for git pull
  - clone regulome-deploy-repo
  - Add data volume for docker
  - wget data from locke
  - git clone 



##### Mireia

En principio haz las cosas como tu user, excepto las partes de docker que tienes que usar root (sudo bash) todo desde /home/mramos/regulome

## instrucciones generales
- Editar el docker-compose.yml para ajustar el tag de la nueva versiÃ³n (recomendable copiar la anterior con otro nombre, esmÃs rÃpido para hacer cambios)
- Pasar a root con "sudo bash"
- docker-compose stop && docker-compose pull && docker-compose up 2>&1 > /var/log/docker-compose.log &
- Si el pull te diera errores (por el login) como root:
- docker login https://registry.imppc.local
- # te pedira login y pass (te los paso por otro lado)
- No es lo mas solido, puede que tengas que hacerlo un par de veces (el error del certificado puedes ignorarlo)
- Una vez hecho login no tienes que hacerlo hasta que haya un reboot del server


## Rollback de una version a otra
# como root desde /home/mramos/regulome

- docker-compose stop
- cambio de yml (docker-compose.yml o editar)
- docker-compose up 2>&1 > /var/log/docker-compose.log &




#### cosas generales de docker:

# listar imagenes
docker images

# borrar imagenes
docker image rm <ID imagen>
# si docker tiene alguna en uso te dira que no



