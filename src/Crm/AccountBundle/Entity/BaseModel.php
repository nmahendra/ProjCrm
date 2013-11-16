<?php

namespace Crm\AccountBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as SER;

/**
 * BaseModel
 *
 * @ORM\MappedSuperclass
 * @ORM\HasLifecycleCallbacks
 */
abstract class BaseModel
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     *
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="create_date", type="datetime")
     */
    private $createDate;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="last_update", type="datetime")
     */
    private $lastUpdate;

    /**
     * @var integer
     *
	 * @var Crm\AccountBundle\Entity\User
	 * @ORM\ManyToOne(targetEntity="Crm\AccountBundle\Entity\User")
	 * @ORM\JoinColumn(name="create_user_id", referencedColumnName="id", nullable=false)
     */
	private $create_user_id;
    
    /**
     * @var integer
     *
	 * @var Crm\AccountBundle\Entity\User
	 * @ORM\ManyToOne(targetEntity="Crm\AccountBundle\Entity\User")
	 * @ORM\JoinColumn(name="modifiyed_user_id", referencedColumnName="id", nullable=false)
     * @ORM\Column(name="modifiyed_user_id", type="integer")
     */
    private $modifiyedUserId;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set createDate
     *
     * @param \DateTime $createDate
     * @return BaseModel
     */
    public function setCreateDate($createDate)
    {
        $this->createDate = $createDate;
    
        return $this;
    }

    /**
     * Get createDate
     *
     * @return \DateTime 
     */
    public function getCreateDate()
    {
        return $this->createDate;
    }

    /**
     * Set lastUpdate
     *
     * @param \DateTime $lastUpdate
     * @return BaseModel
     */
    public function setLastUpdate($lastUpdate)
    {
        $this->lastUpdate = $lastUpdate;
    
        return $this;
    }

    /**
     * Get lastUpdate
     *
     * @return \DateTime 
     */
    public function getLastUpdate()
    {
        return $this->lastUpdate;
    }

    /**
     * Set createUserId
     *
     * @param integer $createUserId
     * @return BaseModel
     */
    public function setCreateUserId($createUserId)
    {
        $this->createUserId = $createUserId;
    
        return $this;
    }

    /**
     * Get createUserId
     *
     * @return integer 
     */
    public function getCreateUserId()
    {
        return $this->createUserId;
    }

    /**
     * Set modifiyedUserId
     *
     * @param integer $modifiyedUserId
     * @return BaseModel
     */
    public function setModifiyedUserId($modifiyedUserId)
    {
        $this->modifiyedUserId = $modifiyedUserId;
    
        return $this;
    }

    /**
     * Get modifiyedUserId
     *
     * @return integer 
     */
    public function getModifiyedUserId()
    {
        return $this->modifiyedUserId;
    }
}
