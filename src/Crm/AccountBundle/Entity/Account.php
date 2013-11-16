<?php

namespace Crm\AccountBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Account
 *
 * @ORM\Table(name="account")
 * @ORM\Entity
 */
class Account extends BaseModel
{

    /**
     * @ORM\Column(type="string",length=100)
     */
    protected $name;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection $contacts
     *
     * @ORM\ManyToMany(targetEntity="Crm\AccountBundle\Entity\Contact",inversedBy="accounts")

     * @ORM\JoinTable(name="account_contact",
     * joinColumns={@ORM\JoinColumn(name="account_id",referencedColumnName="id")},
     * inverseJoinColumns={@ORM\JoinColumn(name="contact_id",referencedColumnName="id")}
     * )
     */
     protected $contacts; 

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
     * Set name
     *
     * @param string $name
     * @return Account
     */
    public function setName($name)
    {
        $this->name = $name;
    
        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set description
     *
     * @param string $description
     * @return Account
     */
    public function setDescription($description)
    {
        $this->description = $description;
    
        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set date_entered
     *
     * @param \DateTime $dateEntered
     * @return Account
     */
    public function setDateEntered($dateEntered)
    {
        $this->date_entered = $dateEntered;
    
        return $this;
    }

    /**
     * Get date_entered
     *
     * @return \DateTime 
     */
    public function getDateEntered()
    {
        return $this->date_entered;
    }

    /**
     * Set date_modified
     *
     * @param \DateTime $dateModified
     * @return Account
     */
    public function setDateModified($dateModified)
    {
        $this->date_modified = $dateModified;
    
        return $this;
    }

    /**
     * Get date_modified
     *
     * @return \DateTime 
     */
    public function getDateModified()
    {
        return $this->date_modified;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->contacts = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * Add contacts
     *
     * @param \Crm\AccountBundle\Entity\Contact $contacts
     * @return Account
     */
    public function addContact(\Crm\AccountBundle\Entity\Contact $contacts)
    {
        $this->contacts[] = $contacts;
    
        return $this;
    }

    /**
     * Remove contacts
     *
     * @param \Crm\AccountBundle\Entity\Contact $contacts
     */
    public function removeContact(\Crm\AccountBundle\Entity\Contact $contacts)
    {
        $this->contacts->removeElement($contacts);
    }

    /**
     * Get contacts
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getContacts()
    {
        return $this->contacts;
    }
}
